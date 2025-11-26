## DUNE Computing Newsletter for November 2025

 The purpose of this newsletter is to inform the collaboration of recent and upcoming changes in computing.  We’re in the middle of an ‘exciting’ time for computing as we’re constantly adapting to new operating systems and authentication methods.  This means there are frequent changes that affect all DUNE users.  We offer [tutorials](https://dune.github.io/computing-basics/), the [wiki](https://wiki.dunescience.org), and a [FAQ](https://github.com/orgs/DUNE/projects/19/) page, but those move more slowly so we’re trying this newsletter as a way to bridge the gap between permanent documentation and real-time announcements.

You can find last month’s newsletter at [https://wiki.dunescience.org/wiki/Computing\_Newsletters](https://wiki.dunescience.org/wiki/Computing_Newsletters)

### Report from DUNE Software and Computing Week 2025

DUNE Core Software & Computing held its 2nd annual S\&C Week at Argonne National Lab Nov 3-6, 2025\. The details and agenda for the meeting can be found here: [https://indico.fnal.gov/event/71186/](https://indico.fnal.gov/event/71186/)  
The week featured extensive discussion and planning for CS\&C projects in the coming year with highlights being a full day on Phlex planning, and coordination talks and discussions with FD Sim/Reco, ND Reco/Sim, AI/ML Forum, and ProtoDUNE DRA Group. CS\&C looks forward to an exciting year ahead and reporting that progress at the next S\&C Week in 2026\.

### BRAAAINS… – our computers have zombies!

Many people like to use VNC’s or VSCODE to access the gpvms and lxplus.  They provide a nice environment for code development but at a cost.  These methods tend to spawn a lot of processes WHICH DO NOT GO AWAY.  After a few weeks our systems are full of zombies left behind by abandoned sessions which can grow to eat memory and CPU as they try to access resources.  We are planning to institute a 7 day limit on running processes to battle this horde of zombies. 

### Think before you submit

We’ve all done it, you submit 10,000 jobs and then find out they all crashed after 36 hours because they hit a time or memory limit, or you mistyped the command to copy the output back.  
Please always run a small test first. We will be re-enabling automated messages that go out to users who waste large amounts of CPU hours with failed jobs or run at very low CPU efficiency.

If a jobsub submission ends up held, please check the \[“Why are my jobs held?”\]([https://fifemon.fnal.gov/monitor/d/000000146/why-are-my-jobs-held?from=now-24h\&to=now\&var-cluster=fifebatch\&orgId=1](https://fifemon.fnal.gov/monitor/d/000000146/why-are-my-jobs-held?from=now-24h&to=now&var-cluster=fifebatch&orgId=1)) page and fix the issue.  Also, if your job takes more than 8GB of memory you need to check for memory leaks before you submit any large number of jobs. 

### New version of the computing-basics tutorial

We've updated the [computing-basics](https://dune.github.io/computing-basics) tutorial.  

- tables of contents at the top of pages.
- updated documentation on tokens, including the new interactive token. 

### New Spack “workflow” release 

V. Hewes has created a new spack v1.0 dune-workflow environment for AL9.  This includes the recent versions of rucio and justIN and allows setup of a basic environment with root and data access tools. The Spack team is still working on full LArSoft.  See the release notes [here](https://github.com/DUNE/data-mgmt-ops/issues/990#issuecomment-3407061445).  

## Updates and reminders from last month

### Reminder: Official Datasets

The Production Group makes official datasets.  The Rice group has created a website for finding them. There are also command line tools for exploring further.  See [the tutorial](https://dune.github.io/computing-basics/03-data-management/index.html#official-datasets-)  for details or go straight to the [website](https://dune-tech.rice.edu/dunecatalog/) to find your samples.

### New Slack channels 

We split the Slack channel for announcing general computing downtimes and answering user questions,  into 2 channels: \#computing-questions and \#computing-announcements.  They seem to be working\!

We strongly encourage everyone who uses DUNE computing (grid, data access, databases, software releases) to join the DUNE Slack and subscribe to \#computing-announcements.

### Reminder of Wednesday down times

A reminder that the Fermilab compute nodes and disk servers undergo monthly maintenance on the 3rd Wednesday of each month. Systems are partially unavailable for 3-6 hours, which leads to things not working.  

### Tokens

Tokens are the new way to authenticate to access dCache disk, our data catalogs (rucio) and submit batch jobs (justin and jobsub). Follow [these instructions](https://dune.github.io/computing-basics/Tokens/index.html).   The recent dune-workflow spack environment (above) can make tokens using justIN get-token, older environments have obsolete justIN instances.

If you just want to access files via root or xrdcp and don’t need rucio or justin you can use this method to get an interactive token.   

~~~  
htgettoken -i dune --vaultserver htvaultprod.fnal.gov -r interactive   
export BEARER_TOKEN_FILE=/run/user/`id -u`/bt_u`id -u`  
export X509_CERT_DIR=/cvmfs/oasis.opensciencegrid.org/mis/certificates  
~~~

### Training group

The training group now meets on alternate Tuesdays at 10 AM FNAL time. Next meeting is tentatively on December 2,  2025 at 10 AM CST

### Tips and Tricks: 

Want to read HDF5 files with LArSoft - for now you need to load a special library on the same line as your lar command.

~~~
LD_PRELOAD=$XROOTD\_LIB/libXrdPosixPreload.so lar -c standard_reco_protodunehd_keepup.fcl $DATA -n 1
~~~
