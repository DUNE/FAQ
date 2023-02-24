# DUNE Token Access FAQ’s

February 23, 2023

Tokens have been introduced as a new way of authenticating yourself for storage, db access and grid jobs. Right now we’re running a dual system with kx509 proxies also allowed but the new token access methods can result in some new error messages..  Here is a list of ones we’ve seen recently and proposed solutions. 

There is some info for grid jobs at:
https://fifewiki.fnal.gov/wiki/Differences_between_jobsub_lite_and_legacy_jobsub_client/server

In particular check out the authentication section
https://fifewiki.fnal.gov/wiki/Getting_started_with_jobsub_lite#More_Explanation_about_Tokens

Commands that are useful:

```
htgettoken -a htvaultprod.fnal.gov -i dune # renew your token
htdestroytoken                             # get rid of them
httokendecode                              # show token
```

Submitting a batch job creates a token for you automatically

You can generally fall back to the old kx509 methods in interactive by doing a `htdestroytoken`

# Attempting OIDC authentication with `https://htvaultprod.fnal.gov:8200`

This can happen either the first time you submit a batch job or when you use htgettoken for the first time.  What's happening under the covers it is that the token magician is asking CILogin if you are a real person.  You need to go to the website and say yes, and then you're cool for a month or more. 

When you submit a batch job or do your first `htgettoken -a htvaultprod.fnal.gov -i dune `

you will see:

```Attempting OIDC authentication with https://htvaultprod.fnal.gov:8200
 
Complete the authentication at:
    https://cilogon.org/device/?user_code=XXXXXX
No web open command defined, please copy/paste the above to any web browser
Waiting for response in web browser
```
Do what it says.  

1. Open any web browser (doesn't have to be on a gpvm) at the url you are given
2. Choose Fermilab as your identity provider
3. authenticate using your services password

And voila, the system will now believe you are a real person for a month and continue as follows:

```
Storing vault token in /tmp/vt_uXXXX
Saving credkey to SOMEPLACE
Saving refresh token ... done
Attempting to get token from https://htvaultprod.fnal.gov:8200 ... succeeded
Storing bearer token in /run/user/XXXX/bt_XXXX
``` 

# Plugin version incompatible

If you see this error message when trying to open a file via xroot

```
Plugin version SecClnt v5.1.0 is incompatible with secztn v5.5.1 (must be <= 5.1.x) in sec.protocol libXrdSecztn-5.so
```

This means you are running an older version of root that is semi-compatible with the new token based dcache access. For now this error message is harmless. 

# Failed to decode bearer token:

If you see this message (people have seen it when using sam commands)

```
Failed to decode bearer token: ExpiredSignatureError('Signature has expired',)
```

It means you are using tokens to access resources and the token has expired (as they do every few hrs). You can renew your token by typing. 

```
htgettoken -a htvaultprod.fnal.gov -i dune 
```

# Can’t write from batch job to persistent

Your batch job ifdh command gives an error when you try to copy to persistent

```
ifdh cp $PWD/time.db $PERSISTENT/.
```
yields
```
Copying 16384 bytes file:///dune/data/users/schellma/LArWrapperExample/time.db => https://fndcadoor.fnal.gov:2880/dune/persistent/users/schellma/./time.db
gfal-copy error: 17 (File exists) - TRANSFER ERROR: Copy failed (streamed). Last attempt: HTTP 403 : Permission refused  (destination)
Perhaps you forgot a -D to indicate destination is a directory? 
Thu Feb 23 11:19:11 2023
 program: www_cp.sh  /dune/data/users/schellma/LArWrapperExample/time.db https://fndcadoor.fnal.gov:2880/dune/persistent/users/schellma/.exited status 17
delaying 23 ...
```

If using tokens, you can no longer write back to persistent. This is to protect your existing files from possible overwrite. 
You should write back to scratch and then ifdh cp your files to persistent once you know they are useful.  

# Writing from scratch to persistent interactively also fails

You may see failures writing from scratch to persistend as well:

For now, your interactive session needs to not be using tokens.  Here is how an interactive session can write back to persistent. 

Tell the system you want to use a kx509 proxy very, very firmly

```
export IFDH_TOKEN_ENABLE=0
export IFDH_PROXY_ENABLE=1 
htdestroytoken
```

if you don't already have a normal old-fashioned proxy, get one

```
kx509
voms-proxy-init -rfc -noregen -voms=dune:/dune/Role=Analysis -valid 120:00
```

set up your copy command, this is just an example

```
export SCRATCH=/pnfs/dune/scratch/users/$USER
export PERSISTENT=/pnfs/dune/persistent/users/$USER
ifdh cp $SCRATCH/myout/time.db $PERSISTENT/myout/.
```
you should see:
```
Copying 24576 bytes https://fndcadoor.fnal.gov:2880/dune/scratch/users/schellma/myout/time.db => https://fndcadoor.fnal.gov:2880/dune/persistent/users/schellma/myout/./time.db
```

That worked!

To copy wildcarded files:

```ifdh cp -D $SCRATCH/myout/*.out $PERSISTENT/myout/.```









