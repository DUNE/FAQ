

# DUNE Computing Newsletter for May-June 2026 


The purpose of this newsletter is to inform the collaboration of recent and upcoming changes in computing.  We’re in the middle of an ‘exciting’ time for computing as we’re constantly adapting to new operating systems and authentication methods.  This means there are frequent changes that affect all DUNE users.  We offer[ tutorials](https://dune.github.io/computing-basics/), the [wiki](https://wiki.dunescience.org), and a [FAQ](https://github.com/orgs/DUNE/projects/19/) page, but those move more slowly so we’re trying this newsletter as a way to bridge the gap between permanent documentation and real-time announcements.

You can find newsletters at [https://wiki.dunescience.org/wiki/Computing_Newsletters](https://wiki.dunescience.org/wiki/Computing_Newsletters).

If you want computing news and have questions, remember to join the DUNE Slack and the #computing-announcements and #computing-questions channels.  (And if you know an answer, please help out.) 

Slack: [#computing-questions](https://dunescience.slack.com/archives/C09NU20U5H6), [#computing-announcements](https://dunescience.slack.com/archives/C7Z6Z9BBP), [#computing_training_group](https://dunescience.slack.com/archives/C01K1R2HBMJ)


## New features and projects


### Cheat Sheets

Tired of reading pages of documentation to do something?  We now have cheat-sheets for fast access to DUNE procedures.

We currently have:

[Git](https://dune.github.io/FAQ/Git) | [MetaCat](https://dune.github.io/FAQ/MetaCat) | [FHiCL](https://dune.github.io/FAQ/FHiCL) | [Spack](https://dune.github.io/FAQ/Spack)

We’re working on 



* Authentication Command summary
* MRB (short version of the basics-larsoft/batch)
* VNC cheat sheet

If you have such a sheet or comments on the ones we have, contact [dune-computing-training@fnal.gov](mailto:dune-computing-training@fnal.gov) or put in an issue at [https://github.com/DUNE/FAQ/issues](https://github.com/DUNE/FAQ/issues) . 


### PHLEX working group

There is now a PHLEX adoption working group which meets alternate Mondays.

Indico: [https://indico.fnal.gov/category/1781/](https://indico.fnal.gov/category/1781/)

DUNE Slack: phlex

Mailing list: dune-phlex

bi-weekly meeting: **Mondays at 10:30 AM CT**

(alternate with AI/ML)

Co-chairs: Gavin S. Davies (gavin.s.davies@gmail.com) and Michel Sorel (sorel@ific.uv.es)

This alternates with the AI/ML meeting


### PHLEX update to v0.3.0

Phlex v0.3.0, the next version in the Phlex prototype series.  Release notes can be found at [https://github.com/Framework-R-D/phlex/releases/tag/v0.3.0](https://github.com/Framework-R-D/phlex/releases/tag/v0.3.0).  Notable features include:



* The ability to read data products from FORM input files
* The `phlex::source` base class, used to generate data-cell indices, and to create providers for data products to be read from an external data source.
* Driver functions that can directly access sources for generating data-cell indices
* Stronger support for unfolds
* Relaxed constraints when specifying data products
* Native Numba support for transforms

This work represents the coordinated efforts of developers from Fermilab, LBNL, and ANL, and it includes contributions from members of the SHiP experiment at CERN. As in the previous prototype releases, Phlex v0.3.0 is known to be incomplete with respect to the Phlex design.  It does, however, represent a significant step forward in how the IO subsystem (via FORM) integrates with core Phlex behavior.

We are currently vetting our installation procedures and making sure extant documentation is up-to-date.  Any issues should be reported at [https://github.com/Framework-R-D/phlex/issues/new](https://github.com/Framework-R-D/phlex/issues/new).

Thank you for your patience and for your continued strong support.


### Group level priorities for batch jobs are here….

We have created a set of physics group-specific quotas in the DUNE global pool.

All physics groups together can take up to 10% of the total cycles in the DUNE global pool.  Work that will be used by several people in the physics group should be coordinated so we don’t have several independent private copies of the same private data sets.  There are corresponding Rucio scopes for each physics group which can be found on the “Scopes” tab in the justin UI, each is allocated between 25-90TB.  To use the corresponding group quota, specify that scope in the justin simple-workflow command.  If there is a medium-large physics group workflow you can apply to the CRAB to have the physics group batch quota temporarily increased.

Note: physics group storage scopes require that files have valid metadata (unlike the usertests scope). If you have not done metadata creation before, download [extractor_new.py](https://github.com/hschellman/computing-basics-batch-devel/blob/gh-pages/_includes/extractor_new.py).


### DUNE DAS hosted at Fermilab, May 11-15, 2026

Last month, [four dozen next generation particle physicists](https://www.instagram.com/p/DYYmuLYFImC/) participated in an immersive [data analysis school](https://npc.fnal.gov/npc-data-analysis-school/) focused specifically on DUNE software, computing, and analysis tools. This inaugural week of learning included physics lectures and hands-on exercises on topics that included TPC and light simulations, reconstruction using Pandora, SPINE, CAF selections, and MaCh3. Prior to the event, the training group offered [Computing Basics](https://dune.github.io/computing-basics/) support. Kudos to the organizing and program committees for their work to make this event a success, and to Vishvas Pandey and Mike Kirby for their pedagogical leadership and perennial vision for DUNE DAS.


## Updates and reminders from previous months


### New VNC instructions 

Many people like to use VNC’s to connect to the gpvms.  This allows you to, for example, open root windows more quickly.  Unfortunately, the default VNC method (often gnome) launch a full desktop environment which spawns hundreds of unused processes. 

Ken Herner has written up how to use **IceWM **instead of gnome. We ask that everyone move to this method as it does not bog down our systems. 

[https://wiki.dunescience.org/wiki/DUNE_Computing/Using_VNC_Connections_on_the_dunegpvms](https://wiki.dunescience.org/wiki/DUNE_Computing/Using_VNC_Connections_on_the_dunegpvms)

Describes how to set up the IceWM on your gpvm

And also provides a script from Dom Brailsford  that you can use to set up your VNC system. 

~~~
source /nashome/d/dbrailsf/setupVNC.sh
~~~


### Spack updates for LArSoft and Phlex

There has been a lot of work on spack builds for DUNE software for use on AL9.  Please join the [#spack](https://dunescience.slack.com/archives/C06M2R1KE5V/p1771279965572669) channel in Slack for frequent updates and to report issues.  We are now up to v1.1 for spack itself and 0_2_0 for Phlex.   For convenience, there are generic setups but they point to versioned instances.


##### To get `larsoft`

~~~
source /cvmfs/dune.opensciencegrid.org/spack/setup-env.sh
echo "Activate dune-prototype"
spack env activate dune-prototype
~~~


##### To get `phlex` (our new framework for testing)

~~~
source /cvmfs/dune.opensciencegrid.org/spack/setup-env.sh
echo "Activate dune-phlex-prototype"
# currently phlex-0_2_0-prototype
spack env activate dune-phlex-prototype
~~~




## Upcoming changes


### InCommon certificate authority change

Most host certificates in the United States institutions are currently issued by InCommon.

InCommon has begun the process of migrating Fermilab to its new certificate backend provider called CertiNext.  These new host certificates will no longer be usable as an SSL client.

Key DUNE services such as the Global Pool frontend and the Rucio server still have certs that can be used as SSL clients, which expire in March of 2027.   By that time DUNE must be in a situation where we use no more SSL client certificates.

There are only 3 DUNE compute sites which do not accept tokens.  One of these three is in process of changing at the moment.  We will also complete the transition of the internals of the DUNE Rucio server, several machines in the DUNE data ingest pipeline, and the GlideinWMS frontend to no longer rely on the InCommon certificates as clients, with the goal of finishing this work by Sep. of 2026.


### Project Genesis Information

Likely announcement on 

DOE has announced a new funding opportunity for the Genesis Mission:

NOFO: DE-FOA-0003612 

[https://science.osti.gov/-/media/grants/pdf/foas/2026/DE-FOA-0003612.pdf](https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fscience.osti.gov%2F-%2Fmedia%2Fgrants%2Fpdf%2Ffoas%2F2026%2FDE-FOA-0003612.pdf&data=05%7C02%7CHeidi.Schellman%40oregonstate.edu%7C4f90549b92294c789da808de88fb661f%7Cce6d05e13c5e4d6287a84c4a2713c113%7C0%7C0%7C639098810673922637%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=uR6iTv2DvYpz5WGtU3hUui4%2Fhb7uTSURJh1pYF2EBzk%3D&reserved=0) 

The deadline has passed for Phase 1 but people need to be thinking about Phase 2 

Genesis Mission Q&A from DOE: 

[https://science.osti.gov/-/media/grants/pdf/foas-resources/2026/Genesis-Mission-RFA-FAQs-20260317.pdf](https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fscience.osti.gov%2F-%2Fmedia%2Fgrants%2Fpdf%2Ffoas-resources%2F2026%2FGenesis-Mission-RFA-FAQs-20260317.pdf&data=05%7C02%7CHeidi.Schellman%40oregonstate.edu%7C4f90549b92294c789da808de88fb661f%7Cce6d05e13c5e4d6287a84c4a2713c113%7C0%7C0%7C639098810673993725%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=Z%2FjeCP7vaDO91sdFc%2F6u57EcupQFYGOI8wpDOrIcNZg%3D&reserved=0) 

We will continue discussion and coordination of Genesis Mission proposals through the DUNE AI/ML Forum:


### AI/ML working group

[https://indico.fnal.gov/category/1676/](https://indico.fnal.gov/category/1676/)

DUNE Slack: ai-ml 

Mailing list: dune-ai-ml

DUNE AI/ML forum bi-weekly meeting: **Mondays at 10:30 AM CT**

Co-chairs: Jianming Bian (bianjm@uci.edu) and Leigh Whitehead (leigh.howard.whitehead@cern.ch)


### **Reminder: Official Datasets**

The Production Group makes official datasets.  The Rice group has created a website for finding them. There are also command line tools for exploring further.  See [the tutorial ](https://dune.github.io/computing-basics/03-data-management/index.html#official-datasets-) for details or go straight to the [website](https://dune-tech.rice.edu/dunecatalog/) to find your samples.


### **Reminder of Wednesday down times**

A reminder that the Fermilab compute nodes and disk servers undergo monthly maintenance on the 3rd Wednesday of each month. Systems are partially unavailable for 3-6 hours, which leads to things not working.  


### **Using SL7**

Just a reminder that running larsoft still requires Scientific Linux 7 in a container.  You can find sample scripts for setting up your container [here](https://dune.github.io/computing-basics/sl7_setup). 


### **Tokens**

Tokens are the new way to authenticate to access dCache disk, our data catalogs (rucio) and submit batch jobs (justin and jobsub). On SL7, follow [these instructions](https://dune.github.io/computing-basics/Tokens/index.html) .  On AL9, it still depends on which Spack environment you are using.  The recent dune-prototype spack environment (above) can make tokens using justIN get-token. We suggest you upgrade to that one.  

If you just want to access files via root or xrdcp and don’t need rucio or justin you can use this method to get an interactive token. 



~~~
htgettoken -i dune --vaultserver htvaultprod.fnal.gov -r interactive 
export BEARER_TOKEN_FILE=/run/user/`id -u`/bt_u`id -u`
export X509_CERT_DIR=/cvmfs/oasis.opensciencegrid.org/mis/certificates
~~~




## **Tips and Tricks:** 


### Want to read HDF5 files with LArSoft - for now you need to load a special library on the same line as your lar command.

~~~
 `LD_PRELOAD=$XROOTD_LIB/libXrdPosixPreload.so lar -c standard_reco_protodunehd_keepup.fcl $DATA -n 1`
~~~

