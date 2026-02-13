## DUNE Computing Newsletter for January 2026 

The purpose of this newsletter is to inform the collaboration of recent and upcoming changes in computing.  We’re in the middle of an ‘exciting’ time for computing as we’re constantly adapting to new operating systems and authentication methods.  This means there are frequent changes that affect all DUNE users.  We offer [tutorials](https://dune.github.io/computing-basics/), the [wiki](https://wiki.dunescience.org), and a [FAQ](https://github.com/orgs/DUNE/projects/19/) page, but those move more slowly so we’re trying this newsletter as a way to bridge the gap between permanent documentation and real-time announcements.

You can find newsletters at [https://wiki.dunescience.org/wiki/Computing\_Newsletters](https://wiki.dunescience.org/wiki/Computing_Newsletters).

## Computing News

### Remember to ask computing questions in the [\#computing-questions](https://dunescience.slack.com/archives/C09NU20U5H6) channel in Slack\!

### Drop-in computing help at the collaboration meeting at CERN

Instead of our traditional computing tutorial, the training group hosted drop-in help sessions during the recent collaboration meeting.  Sitting side by side, expert trainers offered unique hands-on assistance on computing basics setup, justIN batch job management, and LArSoft. Several graduate students and post-docs enjoyed the opportunity. A feature of this type of face-to-face interlude can be in the relationships that are fostered and that continue long term.

These discussions pointed out holes in our existing documentation and examples that we are working to patch.  Stay tuned for more tutorial examples. 

### New AL9 setup has dunesw installed  

There is a new AL9 spack version 1.1 . It includes a new environment \``dune-prototype`\` that includes larsoft.  See [https://dune.github.io/computing-basics/al9\_setup](https://dune.github.io/computing-basics/al9_setup) for the revised example setup for AL9. 



### Analysis workshop May 11-15 at the Neutrino Physics Center at Fermilab

Save the dates - there will be an on-site Analysis Workshop at the NPC from May 11-15, 2026, the week before the collaboration meeting.  Stay tuned for details. 

### VOMS server DN change

The Virtual Organization Membership Service (VOMS) at Fermilab is used to ensure authentication management and grid security for computing users. The two VOMS servers that serve the DUNE VO changed their certificate Distinguished Names on Jan 16 and Jan 30 for voms2 and voms1, respectively.  We believe all issues have now been resolved with this.

## Upcoming changes

### InCommon certificate authority change

Most host certificates in the United States institutions are currently issued by InCommon.  Recent requirements from the Internet CA/Browser forum will no longer allow these certificates to be used as clients to access other web servers.  We will not be able to get any new certs with client capacity after March 31, 2026, although our existing ones will be usable until they expire.  As a result we have reached out to 13 DUNE  compute sites and several storage elements which still only take certificates and make sure they can all accept tokens.  We will also complete the transition of the internals of the DUNE Rucio server, several machines in the DUNE data ingest pipeline, and the GlideinWMS frontend to no longer rely on the InCommon certificates as clients, with the goal of finishing this work by March 2026\.

### Future group-level priorities for batch jobs

Users can currently run jobs with a fair-share priority.  But we often find several people performing similar tasks at large scale and then storing the results, uncataloged, in personal areas.  To preserve resources we plan to move to a tiered priority system where people acting on behalf of physics groups or the production group will have higher priority than individuals. Individuals can still submit their own jobs but will find they run faster if they collaborate within their physics groups.  See [Andrew McNab’s HTCondor priorities talk](https://indico.fnal.gov/event/69460/contributions/328872/attachments/193538/268427/20251120-mcnab-crab-htcondor.pdf%20) for a brief explanation.  Implementation will occur over the next few months. 

## Updates and reminders from last month

### **Reminder: Official Datasets**

The Production Group makes official datasets.  The Rice group has created a website for finding them. There are also command line tools for exploring further.  See [the tutorial](https://dune.github.io/computing-basics/03-data-management/index.html#official-datasets-)  for details or go straight to the [website](https://dune-tech.rice.edu/dunecatalog/) to find your samples.

### **Reminder of Wednesday down times**

A reminder that the Fermilab compute nodes and disk servers undergo monthly maintenance on the 3rd Wednesday of each month. Systems are partially unavailable for 3-6 hours, which leads to things not working.  

### **Using SL7**

Just a reminder that running larsoft still requires Scientific Linux 7 in a container.  You can find sample scripts for setting up your container [here](https://dune.github.io/computing-basics/sl7_setup). 

### **Tokens**

Tokens are the new way to authenticate to access dCache disk, our data catalogs (rucio) and submit batch jobs (justin and jobsub). On SL7, follow [these instructions](https://dune.github.io/computing-basics/Tokens/index.html) .  On AL9, it still depends on which Spack environment you are using.  The recent dune-workflow spack environment (above) can make tokens using justIN get-token. We suggest you upgrade to that one.  

If you just want to access files via root or xrdcp and don’t need rucio or justin you can use this method to get an interactive token. 

~~~
htgettoken -i dune --vaultserver htvaultprod.fnal.gov -r interactive   
export BEARER\_TOKEN\_FILE=/run/user/\`id -u\`/bt\_u\`id -u\`  
export X509\_CERT\_DIR=/cvmfs/oasis.opensciencegrid.org/mis/certificates  
~~~

## **Tips and Tricks:** 

### Want to read HDF5 files with LArSoft - for now you need to load a special library on the same line as your lar command.

~~~
LD_PRELOAD=$XROOTD_LIB/libXrdPosixPreload.so lar -c standard_reco_protodunehd_keepup.fcl $INPUTFILE -n 1
~~~
