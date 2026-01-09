
## CVMFS Phlex install notes 

Notes by Heidi Schellman on following the phlex install instructions.  2026-01-02

With addenda from Mark Mengel on a FNAL specific version that reuses the existing cvmfs version 

Based off of:

[https://github.com/Framework-R-D/phlex/blob/14c7635f228a6bfc6826e5eb9ae3cca544f164b6/INSTALLATION.md](https://github.com/Framework-R-D/phlex/blob/14c7635f228a6bfc6826e5eb9ae3cca544f164b6/INSTALLATION.md)


## Overview

These instructions are intended to get users (not developers) of Phlex to a working environment, starting from scratch. This is not the only way in which this can be done, but this method has been verified on the primary supported OS (Alma Linux 9) and will be supported by the Phlex development team on that platform.

These instructions assume that you have Spack available through CVMFS. 


## Installing Spack

### Step 0: log into a system running AL9 or similar os

These instructions were tested at FNAL but probably work on any systems which have `/cvmfs/` available.

Start with an empty environment. 

### Step 1: create a working directory for phlex use:

Installing software with Spack can require transient use of substantial disk space as packages are downloaded and built. 


```bash
export SPACKAREA=/exp/dune/data/users/$USER/cvmfs-spackarea

export PHLEX_WORK_DIR="${SPACKAREA}/$(id -un)/phlex-work-dir"

mkdir -p ${PHLEX_WORK_DIR}

cd ${PHLEX_WORK_DIR}
```

This took around 4 GB of space so I put it on `/exp/dune/data/`

Then make sure you don't already have a spack  command on your PATH:

which spack

should tell you there is no spack in your PATH.


### Step 2: install Spack (INSTALL NOT NEEDED with CVMFS, instead make a subspack from the cvmfs build) 

Now get spack out of cvmfs


```bash
source /cvmfs/dune.opensciencegrid.org/spack/v1.0/share/spack/setup-env.sh
spack subspack --with_padding ${PHLEX_WORK_DIR}/spack
```



### Step 3: make spack available at the command line.

```bash
source ${PHLEX_WORK_DIR}/spack/share/spack/setup-env.sh
```

`which spack` will show that `spack` is a bash function.





```bash

which spack ```

```Text
spack ()

{ 


    : this is a shell function from: /exp/dune/data/users/schellma/cvmfs-spackarea/schellma/phlex-work-dir/spack/share/spack/setup-env.sh;

    : the real spack script is here: /exp/dune/data/users/schellma/cvmfs-spackarea/schellma/phlex-work-dir/spack/bin/spack;

    _spack_shell_wrapper "$@";

    return $?

}
```


### Step 4: don't need to bootstrap

Comment from Marc Megel: 

“The spack subspack instance doesn't need bootstrapping, it mooches off of the /cvmfs area"

###vStep 5: Modify the Spack configuration to avoid filling `/tmp and /var`.

This is not at all related to Phlex, but until there is spack documentation describing this, we recommend it as good practice.

If you don’t use vi, please reset editor to something you use. 

```bash
export EDITOR="emacs -nw"
```

Run the following, which will open an editor.

```bash
spack config edit config
```

Modify the file to include a new key, `build_stage`. `config` key may already be in the file and may already contain other keys.


```bash
config:

  build_stage:

    - $spack/var/spack/stage
```

(did this, the file was empty before the edit)


## Ensuring a sufficient compiler


### Step 6: ensure that spack has access to a new enough GCC. 


Currently this means GCC 14.

Run `spack compilers` to see what compilers Spack knows about. It may tell you to run `spack compiler find` to autodetect compilers. If so, follow the instructions and afterward re-run `spack compilers`.

Spack compilers on the default /cvmfs/ shows gcc 11 and 12

So need to get gcc 14

Marc suggests:

```bash
spack install -j12 --reuse gcc@14 ```

this took ~ 30 minutes. 

You should probably do: 

`spack compiler find` again to pick up gcc14

Then 

`spack compilers` again


## Creating and installing the Phlex environment

Do spack repo list, see if art is there? 

```bash
spack repo list
```


### Step 7: Add the Spack recipe repositories needed by Phlex:

Note from Marc: “Now the install I did does use art packages built with gcc@12 from upstream with the phlex built with gcc@14,  so one may want to tell Spack to build more of it fresh with the other compiler, but you can try it this way and see if it works okay. “

```bash
spack repo add https://github.com/Framework-R-D/phlex-spack-recipes.git

```

After you have done this, `spack repo list` should show that you have (among others) a repository named `phlex `available to Spack.

```bash 
spack repo list
```

```Text
[+] phlex       v2.0    /nashome/s/schellma/.spack/package_repos/i64efgb/spack_repo/phlex

[+] fnal_art    v2.0    /nashome/s/schellma/.spack/package_repos/putzolp/spack_repo/fnal_art

[+] builtin     v2.2    /nashome/s/schellma/.spack/package_repos/fncqgg4/repos/spack_repo/builtin
```

### Step 8: Create a spack environment and install phlex

To guide the creation of the environment, download the environment configuration file, and create the environment it describes:

```bash
spack env create cvmfs-phlex-environment

spack env activate cvmfs-phlex-environment

spack add phlex %gcc@14

spack concretize
```

The concretization can take up to a few minutes.

(took &lt; 1 m on a gpvm)

Got back:  

```Text
Updating view at /exp/dune/data/users/schellma/cvmfs-spackarea/schellma/phlex-work-dir/envs/cvmfs-phlex-environment/.spack-env/view
```

If it is successful you will see the concretization results listed followed by a notice that spack is updating a view at some path.

You are then ready to build the Phlex environment:

```bash
spack install -j 12 # choose a suitable number of jobs for your machine
```

While the build of `phlex` itself takes a couple of minutes, this install may need to build (and not just download) many other packages. Thus the full installation may take about an hour. 


```Text
Tail end of log:

==> root: Executing phase: 'cmake'

==> root: Executing phase: 'build'

==> root: Executing phase: 'install'

==> root: Successfully installed root-6.36.02-msixfcxxtlgvgnyttyueedgjypkhhnpb

  Stage: 7.67s.  Cmake: 43.75s.  Build: 29m 42.91s.  Install: 35.55s.  Post-install: 3.00s.  Total: 31m 13.17s

[+] /exp/dune/data/users/schellma/cvmfs-spackarea/schellma/phlex-work-dir/packages/linux-x86_64_v2/root-6.36.02-msixfcxxtlgvgnyttyueedgjypkhhnpb

==> No binary for phlex-0.1.0-lqiilxrung5d4jqkn42bp4j6qqydg3ik found: installing from source

==> Installing phlex-0.1.0-lqiilxrung5d4jqkn42bp4j6qqydg3ik [74/74]

==> Fetching https://github.com/framework-r-d/phlex/archive/refs/tags/v0.1.0.tar.gz

    [100%]  208.97 KB @    3.3 MB/s

==> No patches needed for phlex

==> phlex: Executing phase: 'cmake'

==> phlex: Executing phase: 'build'

==> phlex: Executing phase: 'install'

==> phlex: Successfully installed phlex-0.1.0-lqiilxrung5d4jqkn42bp4j6qqydg3ik

  Stage: 0.91s.  Cmake: 10.94s.  Build: 1m 37.33s.  Install: 1.21s.  Post-install: 0.17s.  Total: 1m 50.67s

[+] /exp/dune/data/users/schellma/cvmfs-spackarea/schellma/phlex-work-dir/packages/linux-x86_64_v2/phlex-0.1.0-lqiilxrung5d4jqkn42bp4j6qqydg3ik

==> Updating view at /exp/dune/data/users/schellma/cvmfs-spackarea/schellma/phlex-work-dir/envs/cvmfs-phlex-environment/.spack-env/view
```

When the installation is complete, you should find that the `phlex` executable is on your PATH. `which phlex` will verify this.

```bash
which phlex
```

```Text
/exp/dune/data/users/schellma/cvmfs-spackarea/schellma/phlex-work-dir/envs/cvmfs-phlex-environment/.spack-env/view/bin/phlex
```

## Actually trying to use it - 

In the original session

```bash
spack env activate cvmfs-phlex-environment
```

Works fine 

But in a new window I need to activate the right spack

Made a script with this and was able to set up the environment

put this in `$HOME/setup_phlex.sh`

```bash
export PHLEX_WORK_DIR="/exp/dune/data/users/$USER/cvmfs-spackarea/$(id -un)/phlex-work-dir"
source ${PHLEX_WORK_DIR}/spack/share/spack/setup-env.sh
spack env activate cvmfs-phlex-environment

```



## Test it with examples:

[https://github.com/Framework-R-D/phlex-examples/blob/main/README.md](https://github.com/Framework-R-D/phlex-examples/blob/main/README.md)  

Followed the procedure from that site. 

Had to add:

```bash
export PHLEX_TEST=someplace
```

And do the instruction in that area rather than home area.

Had to change example to examples in the cmake phase. 

And then after the build I had to explicitly tell it where the plugins were. 

```bash
cd phlex-examples
export PHLEX_PLUGIN_PATH=$PHLEX_TEST/build-phlex-examples/:$PHLEX_PLUGIN_PATH
phlex -c $PHLEX_TEST/phlex-examples/test-cpp-workflow.jsonnet
```

Then the c++ test ran just fine. Without the `PLUGIN_PATH` it fails to find the code. 

####
For python:

```bash
export PYTHONPATH=$(realpath ../phlex-examples):$PYTHONPATH
phlex -c ./test-py-workflow.jsonnet
```

Runs just fine. 

I put in an issue:

[https://github.com/Framework-R-D/phlex-examples/issues/2](https://github.com/Framework-R-D/phlex-examples/issues/2)
