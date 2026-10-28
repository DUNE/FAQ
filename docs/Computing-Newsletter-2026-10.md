
## DUNE Computing Newsletter for September- October 2026 


## The purpose of this newsletter is to inform the collaboration of recent and upcoming changes in computing.  We’re in the middle of an ‘exciting’ time for computing as we’re constantly adapting to new operating systems and authentication methods.  This means there are frequent changes that affect all DUNE users.  We offer[ tutorials](https://dune.github.io/computing-basics/), the [wiki](https://wiki.dunescience.org), and a [FAQ](https://github.com/orgs/DUNE/projects/19/) page, but those move more slowly so we’re trying this newsletter as a way to bridge the gap between permanent documentation and real-time announcements.

You can find newsletters at [https://wiki.dunescience.org/wiki/Computing_Newsletters](https://wiki.dunescience.org/wiki/Computing_Newsletters).

If you want computing news and have questions, remember to join the DUNE Slack and the #computing-announcements and #computing-questions channels.  (And if you know an answer, please help out.) 

Slack: [#computing-questions](https://dunescience.slack.com/archives/C09NU20U5H6), [#computing-announcements](https://dunescience.slack.com/archives/C7Z6Z9BBP), [#computing_training_group](https://dunescience.slack.com/archives/C01K1R2HBMJ)


## New features and projects


### New Training Home Page

[https://dune.github.io/computing-training/](https://dune.github.io/computing-training/)  is a home page for all things relating to DUNE computing training.  If you have a training you would like to advertise, see the instructions linked at the bottom of the page or contact 


### More PHLEX documentation

From Kyle Knoepfel - the Phlex team has published an **[art-to-Phlex migration guide](https://framework-r-d.github.io/phlex-examples/)**.  

“We relied heavily on AI to produce it, but we also scrutinized the AI output quite closely and adjusted the output where necessary.  The content is an accurate reflection of what we think is reasonable when considering how to migrate from art-based modules to Phlex constructs and framework-agnostic algorithms.  It is, by no means, complete, and it does not purport to solve every migration issue.”

Join #phlex on Slack for more information, look at the [DUNE specific documentation](https://dune.github.io/dune-phlex-project/) and check out some general examples: [https://github.com/Framework-R-D/phlex-examples](https://github.com/Framework-R-D/phlex-examples)


### FNAL gpvm reconfiguration

To increase the memory available for code development the DUNE General Purpose Virtual Machines (GPVMs that serve as the interactive computing nodes at Fermilab) were reconfigured and rebooted on Wed, Sept 16, 2026. This reconfiguration reduced the number of gpvms from 16 to 10 but also increased the memory per VM from 12 to 23 GB.  After the reconfiguration, the ssh host keys need to be reset.  You can do this by editing the ~/.ssh/known_hosts file on your personal computer to comment out existing gpvm keys. 


### Computing basics tutorial was held on September 10, 2026

A three hour DUNE [Computing Basics](https://dune.github.io/computing-basics/) tutorial took place via Zoom on Thursday, September 10th.  It covered [interactive computing,](https://dune.github.io/computing-basics/01.7-InteractiveComputingResources/index.html) [storage spaces](https://dune.github.io/computing-basics/02-storage-spaces/index.html), [finding data](https://dune.github.io/computing-basics/03-data-management/index.html) and the [basics of LArSoft](https://dune.github.io/computing-basics-larsoft/).

We’ve added a new basics chapter describing the general interactive computing resources and proper use of VNC’s  ([Interactive Computing Resources](https://dune.github.io/computing-basics/01.7-InteractiveComputingResources/index.html))

The Basics tutorials can be done independently and include videos. 


### October DUNE PHLEX workshop in India 

[https://dune-tech.rice.edu/RGI_DUNEworkshop/](https://dune-tech.rice.edu/RGI_DUNEworkshop/)

October 26-30, 2026 at the Indian Institute of Science, Bengaluru, India

DUNE collaboration members, physicists, computer scientists, and software engineers are meeting this week in Bengaluru to discuss PHLEX adoption through a mix of lectures on DUNE science, software and computing and hands-on sessions.   As DUNE moves toward PHLEX implementation, this workshop offers a timely opportunity to build momentum and coordinate support.   This workshop is in-person only and was limited to students at Indian institutions. It currently has 61 registered participants, including students and instructors. 

The indico is: [https://indico.cern.ch/event/1721472/timetable/#20261026](https://indico.cern.ch/event/1721472/timetable/#20261026)  We hope to offer a version of this workshop in other locations in future. 


### Enhanced Dataset searches

The DUNE data catalog webpage ​​[https://dune-tech.rice.edu/dunecatalog/](https://dune-tech.rice.edu/dunecatalog/) has incorporated new features. Users can search a dataset and open any file's detail page, where they can view its **Rucio replica info**, **metadata**, and **provenance**, with a one-click copy of the replica info for use in interactive jobs.  The catalog also supports advanced searches from the Other tab, including MQL queries with native wildcard syntax and queries to the **conditions DB (ProtoDUNE-HD and VD),** which can be filtered by **run**, by **momentum**, or by **start/stop date** or **gain**.  We have also updated our documentation [here in docDB](https://docs.dunescience.org/cgi-bin/sso/RetrieveFile?docid=33738&filename=DUNE_Catalog_User_Guide.pdf&version=3)


### Reminder – VNC instructions 

Many people like to use VNC’s to connect to the gpvms.  This allows you to, for example, open root windows more quickly.  Unfortunately, many VNC methods (often gnome) launch a full desktop environment which spawns hundreds of unused processes.  If your processes cause significant resource wastage, expect a slack or email message from management asking you to kill all your processes and to switch your VNC methods. 

Ken Herner has written up how to use **IceWM **instead of gnome. We ask that everyone move to this method as it does not bog down our systems. 

[https://wiki.dunescience.org/wiki/DUNE_Computing/Using_VNC_Connections_on_the_dunegpvms](https://wiki.dunescience.org/wiki/DUNE_Computing/Using_VNC_Connections_on_the_dunegpvms)

describes how to set up the IceWM on your gpvm and also provides a script from Dom Brailsford  that you can use to set up your VNC system. 

~~~

source /nashome/d/dbrailsf/setupVNCNew.sh

~~~


### Spack updates for LArSoft and Phlex

There has been a lot of work on spack builds for DUNE software for use on AL9.  Please join the [#spack](https://dunescience.slack.com/archives/C06M2R1KE5V/p1771279965572669) channel in Slack for frequent updates and to report issues. You can submit issues and view status at [https://dune.github.io/dune-spack-project/](https://dune.github.io/dune-spack-project/).  We are now up to v1.2.2 for spack itself and 0_3_2 for Phlex.   For convenience, there are generic setups but they point to versioned instances. There is also a [Spack Cheat Sheet](https://github.com/DUNE/FAQ/blob/main/docs/Spack.md) with common commands.

The lar version in spack is now pretty complete. Please test running lar from an AL9 window and report issues at [https://dune.github.io/dune-spack-project/](https://dune.github.io/dune-spack-project/)


##### To get `larsoft`

~~~


```
source /cvmfs/dune.opensciencegrid.org/spack/setup-env.sh
echo "Activate dune-prototype"
spack env activate dune-prototype
```


~~~

The replacement from MRB (MPD) is [documented here](https://github.com/FNALssi/spack-mpd/blob/main/README.md). 

To get `phlex` (our new framework for testing)

~~~


```
source /cvmfs/dune.opensciencegrid.org/spack/setup-env.sh
echo "Activate dune-phlex-prototype"
spack env activate dune-phlex-prototype
~~~
```



## Updates and reminders from previous months


#### **Reminder: Official Datasets**

The Production Group makes official datasets.  The Rice group has created a website for finding them. There are also command line tools for exploring further.  See [the tutorial ](https://dune.github.io/computing-basics/03-data-management/index.html#official-datasets-) for details or go straight to the [website](https://dune-tech.rice.edu/dunecatalog/) to find your samples.


#### **Reminder of Wednesday down times**

A reminder that the Fermilab compute nodes and disk servers undergo monthly maintenance on the 3rd Wednesday of each month. Systems are partially unavailable for 3-6 hours, which leads to things not working.  


#### **Tokens**

Tokens are the new way to authenticate to access dCache disk, our data catalogs (rucio) and submit batch jobs (justin and jobsub). On both AL9 and SL7, follow [these instructions](https://dune.github.io/computing-basics/Tokens/index.html).   The recent dune-prototype spack environment (above) can make tokens using justIN get-token. We suggest you upgrade to that one.  

If you just want to access files via `root` or `xrdcp` and don’t need `rucio` or justin you can use this method to get an interactive token. 

~~~

htgettoken -i dune --vaultserver htvaultprod.fnal.gov -r interactive 

export BEARER_TOKEN_FILE=/run/user/`id -u`/bt_u`id -u`

export X509_CERT_DIR=/cvmfs/oasis.opensciencegrid.org/mis/certificates

~~~


#### **Tips and Tricks: **


#### Want to read HDF5 files with LArSoft?  for now you need to load a special library on the same line as your lar command.

~~~

LD_PRELOAD=$XROOTD_LIB/libXrdPosixPreload.so lar -c standard_reco_protodunehd_keepup.fcl $DATA -n 1

~~~
