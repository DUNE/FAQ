

## DUNE Computing Newsletter for October 2025

10-27-2025

Welcome to the inaugural edition of the DUNE Computing Monthly Newsletter.  The purpose of this newsletter is to inform the collaboration of recent and upcoming changes in computing.  We’re in the middle of an ‘exciting’ time for computing as we’re constantly adapting to new operating systems and authentication methods.  This means there are frequent changes that affect all DUNE users.  We offer[ tutorials](https://dune.github.io/computing-basics/), the [wiki](https://wiki.dunescience.org), and a [FAQ](https://github.com/orgs/DUNE/projects/19/) page, but those move more slowly so we’re trying this newsletter as a way to bridge the gap between permanent documentation and real-time announcements.


### DUNE S&C Week 2025

We invite participation from all collaborators in the 2nd Annual DUNE Core Software & Computing week that is scheduled for Nov 3-6, 2025. The registration and agenda for the event can be found here: [https://indico.fnal.gov/event/71186/](https://indico.fnal.gov/event/71186/)

If attending in person and you do not already have access to Argonne National Lab, you **must also **complete an Argonne visitor form: [https://apps.anl.gov/registration/visitors](https://apps.anl.gov/registration/visitors) Enter Sponsor email: [nrezek@anl.gov](mailto:nrezek@anl.gov)


### Official Datasets

The Production Group makes official datasets.  The Rice group has created a website for finding them. There are also command line tools for exploring further.  See [the tutorial ](https://dune.github.io/computing-basics/03-data-management/index.html#official-datasets-) for details or go straight to the [website](https://dune-tech.rice.edu/dunecatalog/) to find your samples.


### New Slack channels 

We are going to split the Slack channel for announcing general computing downtimes and answering user questions,  #user_grid_usage, into 2 channels: #computing-questions and #computing-announcements.  

We strongly encourage everyone who uses DUNE computing (grid, data access, databases, software releases) to join the DUNE Slack and subscribe to #computing-announcements.


### Reminder of Wednesday down times

A reminder that the Fermilab compute nodes and disk servers undergo monthly maintenance on the 3rd Wednesday of each month. Systems are partially unavailable for 3-6 hours, which leads to things not working.  


### Changes in the address for Fermilab dCache 

The dCache disk at Fermilab has migrated to a new “door”.  File locations that look like: root://fndca1.fnal.gov need to change to root://[fndcadoor.fnal.gov](fndcadoor.fnal.gov).  Both work for now but there may be decreased performance if you use the older names.  This should not affect people who use the data catalogs as they have been updated, but any lists of locations you may have stored should be updated for best performance.  If you have your own local version of pnfs2xrootd you can find a new one [here](https://dune.github.io/computing-basics/pnfs2xrootd),


### New Spack “workflow” release 

V. Hewes has created a new spack v1.0 dune-workflow environment for AL9.  This includes the recent versions of rucio and justIN and allows setup of a basic environment with root and data access tools. The Spack team is still working on full LArSoft.  See the release notes [here](https://github.com/DUNE/data-mgmt-ops/issues/990#issuecomment-3407061445).  


### Tokens

Tokens are the new way to authenticate to access dCache disk, our data catalogs (rucio) and submit batch jobs (justin and jobsub). Right now different use cases require different token methods.  On SL7, follow [these instructions](https://dune.github.io/computing-basics/Tokens/index.html) .  On AL9, it still depends on which Spack environment you are using.  The recent dune-workflow spack environment (above) can make tokens using justIN get-token, older environments have obsolete justIN instances.


### Upgrade to Rucio 38 

We are now using rucio v38 which has better support for tokens.


### Database news

There is a new hardware database mailing list. 



* New: HWDB mailing list: *[DUNE-HWDB@FNAL.GOV](mailto:DUNE-HWDB@FNAL.GOV)* \
To subscribe: \
- Send an e-mail message to *[listserv@fnal.gov](mailto:listserv@fnal.gov)* \
- Leave the subject line blank \
- Type: SUBSCRIBE DUNE-HWDB FIRSTNAME LASTNAME


### Training group

The training group now meets on alternate Tuesdays at 10 AM FNAL time. Next meeting is tentatively on November 4, 2025 at 10 AM as part of the DUNE computing week. 


### Tips and Tricks: 

Want to read HDF5 files with LArSoft - for now you need to load a special library on the same line as your lar command.

 `LD_PRELOAD=$XROOTD_LIB/libXrdPosixPreload.so lar -c standard_reco_protodunehd_keepup.fcl $DATA -n 1`
