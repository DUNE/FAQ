## DUNE Computing Newsletter for March 2026 

The purpose of this newsletter is to inform the collaboration of recent and upcoming changes in computing.  We’re in the middle of an ‘exciting’ time for computing as we’re constantly adapting to new operating systems and authentication methods.  This means there are frequent changes that affect all DUNE users.  We offer tutorials, the wiki, and a FAQ page, but those move more slowly so we’re trying this newsletter as a way to bridge the gap between permanent documentation and real-time announcements.

You can find newsletters at [https://wiki.dunescience.org/wiki/Computing_Newsletters](https://wiki.dunescience.org/wiki/Computing_Newsletters).

If you want computing news and have questions, remember to join the DUNE Slack and the #computing-announcements and #computing-questions channels.  (And if you know an answer, please help out.) 

Slack: #computing-questions, #computing-announcements, #computing_training_group

### Project Genesis Information

DOE has announced a new funding opportunity for the Genesis Mission:

NOFO: DE-FOA-0003612 
[https://science.osti.gov/-/media/grants/pdf/foas/2026/DE-FOA-0003612.pdf](https://science.osti.gov/-/media/grants/pdf/foas/2026/DE-FOA-0003612.pdf) 

In this call, DOE has included DUNE as a Genesis Mission focus area (focus 14(b)), providing an important opportunity for coordinated proposals from the DUNE community.

DUNE collaboration PIs are encouraged to communicate and coordinate to form teams including two out of 3 of national lab/university/industry as required by the NOFO. There is a limitation on the number of lead-PI’s per institution per focus group but not on co-PI’s.

DOE plans to hold an informational webinar about this RFA on Thursday, March 26, 2026 at 3 PM Eastern. 

Registration: 
[https://science-doe.zoomgov.com/webinar/register/WN_cByyhWASR72Do7yIDpe3_g](https://science-doe.zoomgov.com/webinar/register/WN_cByyhWASR72Do7yIDpe3_g) 


The CompHEP Office (Jeremy Love) will also hold office hours every Wednesday from 11:00 AM to 12:00 PM ET to answer questions about the program, AI/ML research, and HEP’s involvement in the Genesis Mission.

[https://science-doe.zoomgov.com/j/1617448878?pwd=MH7iPTGIHJg8KaCFPq1lbjQa9vzcAn.1](https://science-doe.zoomgov.com/j/1617448878?pwd=MH7iPTGIHJg8KaCFPq1lbjQa9vzcAn.1) 

Genesis Mission Q&A from DOE: 

[https://science.osti.gov/-/media/grants/pdf/foas-resources/2026/Genesis-Mission-RFA-FAQs-20260317.pdf](https://science.osti.gov/-/media/grants/pdf/foas-resources/2026/Genesis-Mission-RFA-FAQs-20260317.pdf)

We will continue discussion and coordination of Genesis Mission proposals through the DUNE AI/ML Forum:

- [https://indico.fnal.gov/category/1676/](https://indico.fnal.gov/category/1676/)
- DUNE Slack: #ai-ml 
- Mailing list: dune-ai-ml@fnal.gov
- DUNE AI/ML forum bi-weekly meeting: Mondays at 10:00 AM CT
(Most recent meeting: March 23, 2026)
- Co-chairs: Jianming Bian (bianjm@uci.edu) and Leigh Whitehead (leigh.howard.whitehead@cern.ch)

## Upcoming Events

### Neutrino Physics Center Analysis Workshop at Fermilab, 

May 11-15, 2026
Mark your calendars for May 11–15, 2026, for the NPC DUNE Data Analysis School (NPC-DDAS) at Fermilab. The school will provide focused, practical training in DUNE analysis tools and workflows. Applications will open soon; some financial support will be available for selected participants. More info: [https://npc.fnal.gov/npc-data-analysis-school/](https://npc.fnal.gov/npc-data-analysis-school/)

### Drop-in computing help at the collaboration meeting in Rapid City

There will be drop-in computing help sessions at the collaboration meeting. Times to be announced. 

## Progress reports and new ways to do things

### New VNC instructions 

Many people like to use VNC’s to connect to the gpvms.  This allows you to, for example, open root windows more quickly.  Unfortunately, the default VNC method (often gnome) launch a full desktop environment which spawns hundreds of unused processes. 

Ken Herner has written up how to use IceWM instead of gnome. We ask that everyone move to this method as it does not bog down our systems. 

[https://wiki.dunescience.org/wiki/DUNE_Computing/Using_VNC_Connections_on_the_dunegpvms](https://wiki.dunescience.org/wiki/DUNE_Computing/Using_VNC_Connections_on_the_dunegpvms)

Describes how to set up the IceWM on your gpvm

And also provides a script from Dom Brailsford  that you can use to set up your VNC system. 

~~~
source /nashome/d/dbrailsf/setupVNC.sh
~~~

### Report from the Joint DUNE AI/ML and CS&S workshop 

Held March 10–12 at Rice's BioScience Research Collaborative, the three-day workshop [https://indico.fnal.gov/event/72868/](https://indico.fnal.gov/event/72868/) explored how the CS&SC consortium can better support the growing role of AI and ML in DUNE. On Day 1, participants reviewed the upcoming physics goals of the experiment and learned how the various working groups are incorporating new AI/ML trends into DUNE's toolkits. Day 2 focused on available computing resources (GPUs), future plans to expand them, support for AI/ML workflows, and how large language models are being explored within DUNE. On the final day, participants examined emerging topics, from foundation models to differential programming and concluded by summarizing the workshop's key action items.

### Spack updates for LArSoft and Phlex

There has been a lot of work on spack builds for DUNE software for use on AL9.  Please join the #spack channel in Slack for frequent updates. 

From V. Hewes (2/16/2026) : the spack environments on CVMFS were just updated 
– there was a minor update to dune-sw-10_11_01d00-justin-01_06_00-prototype (dune-prototype) reflecting changes in the upstream FNAL environment, and there is also a new phlex-0_1_0-prototype environment, which is symlinked as dune-phlex-prototype for convenience. Please let me know if you run into any issues, either with the updated dunesw environment or the new phlex environment!

To get larsoft

~~~
source /cvmfs/dune.opensciencegrid.org/spack/setup-env.sh
echo "Activate dune-prototype"
spack env activate dune-sw-10_11_01d00-justin-01_06_00-prototype
~~~

To get phlex (our new framework for testing)

~~~
source /cvmfs/dune.opensciencegrid.org/spack/setup-env.sh
echo "Activate dune-phlex-prototype"
spack env activate phlex-0_1_0-prototype
~~~

## Upcoming changes

### InCommon certificate authority change

Most host certificates in the United States institutions are currently issued by InCommon.  Recent requirements from the Internet CA/Browser forum will no longer allow these certificates to be used as clients to access other web servers.  We will not be able to get any new certs with client capacity after March 31, 2026, although our existing ones will be usable until they expire.  As a result we will be reaching out to 13 compute sites and several storage elements which still only take certificates and make sure they can all accept tokens.  We will also complete the transition of the internals of the DUNE Rucio server, several machines in the DUNE data ingest pipeline, and the GlideinWMS frontend to no longer rely on the InCommon certificates as clients, with the goal of finishing this work by March 2026.

### Future group level priorities for batch jobs

Users can currently run jobs with a fair-share priority.  But we often find several people performing similar tasks at large scale and then storing the results, uncataloged, in personal areas.  To preserve resources we plan to move to a tiered priority system where people acting on behalf of physics groups or the production group will have higher priority than individuals. Individuals can still submit their own jobs but will find they run faster if they collaborate within their physics groups.  See Andrew McNab’s talk for a brief explanation.  Implementation will occur over the next few months. 

## Updates and reminders from previous months

### Reminder: Official Datasets

The Production Group makes official datasets.  The Rice group has created a website for finding them. There are also command line tools for exploring further.  See the tutorial  for details or go straight to the website to find your samples.

### Reminder of Wednesday down times

A reminder that the Fermilab compute nodes and disk servers undergo monthly maintenance on the 3rd Wednesday of each month. Systems are partially unavailable for 3-6 hours, which leads to things not working.  

### Using SL7

Just a reminder that running larsoft still requires Scientific Linux 7 in a container.  You can find sample scripts for setting up your container here. 

### Tokens

Tokens are the new way to authenticate to access dCache disk, our data catalogs (rucio) and submit batch jobs (justin and jobsub). On SL7, follow these instructions .  On AL9, it still depends on which Spack environment you are using.  The recent dune-workflow spack environment (above) can make tokens using justIN get-token. We suggest you upgrade to that one.  

If you just want to access files via root or xrdcp and don’t need rucio or justin you can use this method to get an interactive token. 

~~~
htgettoken -i dune --vaultserver htvaultprod.fnal.gov -r interactive 
export BEARER_TOKEN_FILE=/run/user/`id -u`/bt_u`id -u`
export X509_CERT_DIR=/cvmfs/oasis.opensciencegrid.org/mis/certificates
~~~

## Tips and Tricks: 

### Want to read HDF5 files with LArSoft

For now you need to load a special library on the same line as your lar command.

~~~
 LD_PRELOAD=$XROOTD_LIB/libXrdPosixPreload.so lar -c standard_reco_protodunehd_keepup.fcl $DATA -n 1
~~~

