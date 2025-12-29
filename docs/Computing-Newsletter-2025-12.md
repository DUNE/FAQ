## DUNE Computing Newsletter for December 2025

 The purpose of this newsletter is to inform the collaboration of recent and upcoming changes in computing.  We’re in the middle of an ‘exciting’ time for computing as we’re constantly adapting to new operating systems and authentication methods.  This means there are frequent changes that affect all DUNE users.  We offer[ tutorials](https://dune.github.io/computing-basics/), the [wiki](https://wiki.dunescience.org), and a [FAQ](https://github.com/orgs/DUNE/projects/19/) page, but those move more slowly so we’re trying this newsletter as a way to bridge the gap between permanent documentation and real-time announcements.

You can find last month’s newsletter at [https://wiki.dunescience.org/wiki/Computing_Newsletters](https://wiki.dunescience.org/wiki/Computing_Newsletters)


### Drop-in computing help at the collaboration meeting at CERN

Instead of a tutorial the training group is planning drop-in help sessions for user’s computing issues at the collaboration meeting.  We will be in room D (near the Council Chambers) from 12:00-15:00 on Wednesday and Thursday.  Come by with your computing questions.  We hope to have experts in larsoft and general computing questions. 


### First prototype release of Phlex - 

Phlex is a new data-processing framework that supports the parallel, hierarchical, and layered execution of data-processing algorithms. See [Phlex-design-v0.2.pdf](https://docs.dunescience.org/cgi-bin/sso/RetrieveFile?docid=34405&filename=phlex-design-v0.2.pdf&version=1) for the conceptual design report. 

The Phlex developers are pleased to announce the [first prototype release of Phlex](https://github.com/Framework-R-D/phlex/releases/tag/v0.1.0).  This is a big milestone for the Phlex development team, the FORM developers, and for DUNE.  We have written some basic instructions for installing Phlex (which includes FORM) and getting started with it a t[https://github.com/framework-r-d/phlex](https://github.com/framework-r-d/phlex). 

Because it’s a prototype, it has some rough edges.  We expect that we will be able to explain those more fully at the collaboration meeting on Tuesday at 1700 at CERN.   At the same time, we are prepared to interact with individuals (beginning Jan. 5) if folks want to start playing with it before then. 

Any interested party is welcome to download it and start kicking the tires over the holiday break. (Note - I (HMS) was able to [successfully install plex on a gpvm](https://docs.google.com/document/u/1/d/1Su0kbDi3rlb8cPtNg8Nhybuu0ZTuybEx-6RowuAATV8/edit).  The instructions are excellent.)

The developers have been working very hard to get it out the door this week, so many of them will be taking some time off in the next two weeks. Thus there will be no support or assistance until January 5th, and testers should not expect answers to questions before then. Even so, this is a good time to try things out so we can hit the ground running in January.

[https://github.com/Framework-R-D/phlex/releases/tag/v0.1.0](https://github.com/Framework-R-D/phlex/releases/tag/v0.1.0)

[https://github.com/framework-r-d/phlex](https://github.com/framework-r-d/phlex)


### Future group level priorities for batch jobs

Users can currently run jobs with a fair-share priority.  But we often find several people performing similar tasks at large scale and then storing the results, uncataloged, in personal areas.  To preserve resources we plan to move to a tiered priority system where people acting on behalf of physics groups or the production group will have higher priority than individuals. Individuals can still submit their own jobs but will find they run faster if they collaborate within their physics groups.  See [Andrew McNab’s talk](https://indico.fnal.gov/event/69460/contributions/328872/attachments/193538/268427/20251120-mcnab-crab-htcondor.pdf ) for a brief explanation.  Implementation will occur over the next few months. 


## Updates and reminders from last month


### **Reminder: Official Datasets**

The Production Group makes official datasets.  The Rice group has created a website for finding them. There are also command line tools for exploring further.  See [the tutorial ](https://dune.github.io/computing-basics/03-data-management/index.html#official-datasets-) for details or go straight to the [website](https://dune-tech.rice.edu/dunecatalog/) to find your samples.


### **New Spack “workflow” release **

V. Hewes has created a new spack v1.0 dune-workflow environment for AL9.  This includes the recent versions of rucio and justIN and allows setup of a basic environment with root and data access tools. The Spack team is still working on full LArSoft.  See the release notes [here](https://github.com/DUNE/data-mgmt-ops/issues/990#issuecomment-3407061445).  


### **Reminder of Wednesday down times**

A reminder that the Fermilab compute nodes and disk servers undergo monthly maintenance on the 3rd Wednesday of each month. Systems are partially unavailable for 3-6 hours, which leads to things not working.  





### **Tokens**

Tokens are the new way to authenticate to access dCache disk, our data catalogs (rucio) and submit batch jobs (justin and jobsub). On SL7, follow [these instructions](https://dune.github.io/computing-basics/Tokens/index.html) .  On AL9, it still depends on which Spack environment you are using.  The recent dune-workflow spack environment (above) can make tokens using justIN get-token. We suggest you upgrade to that one.  

If you just want to access files via root or xrdcp and don’t need rucio or justin you can use this method to get an interactive token. 

~~~

htgettoken -i dune --vaultserver htvaultprod.fnal.gov -r interactive 

export BEARER_TOKEN_FILE=/run/user/`id -u`/bt_u`id -u`

export X509_CERT_DIR=/cvmfs/oasis.opensciencegrid.org/mis/certificates

~~~


## **Tips and Tricks: **


### Want to read HDF5 files with LArSoft - for now you need to load a special library on the same line as your lar command.

 `LD_PRELOAD=$XROOTD_LIB/libXrdPosixPreload.so lar -c standard_reco_protodunehd_keepup.fcl $DATA -n 1`

 ### **Using SL7**

Just a reminder that running larsoft still requires Scientific Linux 7 in a container.  You can find sample scripts for setting up your container [here](https://dune.github.io/computing-basics/sl7_setup). 
