## DUNE Computing Newsletter for April 2026 


The purpose of this newsletter is to inform the collaboration of recent and upcoming changes in computing.  We’re in the middle of an ‘exciting’ time for computing as we’re constantly adapting to new operating systems and authentication methods.  This means there are frequent changes that affect all DUNE users.  We offer[ tutorials](https://dune.github.io/computing-basics/), the [wiki](https://wiki.dunescience.org), and a [FAQ](https://github.com/orgs/DUNE/projects/19/) page, but those move more slowly so we’re trying this newsletter as a way to bridge the gap between permanent documentation and real-time announcements.

You can find newsletters at [https://wiki.dunescience.org/wiki/Computing_Newsletters](https://wiki.dunescience.org/wiki/Computing_Newsletters).

If you want computing news and have questions, remember to join the DUNE Slack and the `#computing-announcements` and `#computing-questions` channels.  (And if you know an answer, please help out.) 

Slack: [#computing-questions](https://dunescience.slack.com/archives/C09NU20U5H6), [#computing-announcements](https://dunescience.slack.com/archives/C7Z6Z9BBP), [#computing_training_group](https://dunescience.slack.com/archives/C01K1R2HBMJ)


## Upcoming Events


### Neutrino Physics Center Analysis Workshop at Fermilab, May 11-15, 2026

The NPC DUNE Data Analysis School (NPC-DDAS) will be held Fermilab. The school will provide focused, practical training in DUNE analysis tools and workflows. 30 people have registered and will be attending in person. More info: [https://npc.fnal.gov/npc-data-analysis-school/](https://npc.fnal.gov/npc-data-analysis-school/)<span style="text-decoration:underline;"> and [https://indico.fnal.gov/event/73408/](https://indico.fnal.gov/event/73408/). </span>


### Computing Setup Tutorial on 

There will be a pre-workshop online setup session for people new to using the Fermilab computers.  It will be held on Wednesday May 6, 2-4 PM Fermilab time.  This is a session to help people use the Fermilab computers before the NPC Analysis workshop.  It is open to all DUNE collaborators.  People not registered for the NPC workshop need [to register here to receive the zoom link. ](https://indico.fnal.gov/event/74345/registrations/4817/)We will cover the material in [https://dune.github.io/computing-basics/](https://dune.github.io/computing-basics/) and parts of [https://dune.github.io/computing-basics-larsoft/](https://dune.github.io/computing-basics/)


### Computing Help Sessions at the Collaboration Meeting in South Dakota

We plan to hold in person computing help sessions.  They are not scheduled yet but are likely to be during lunch breaks on Tuesday and Wednesday.  


## Progress reports and new ways to do things


### New VNC instructions 

Many people like to use VNC’s to connect to the gpvms.  This allows you to, for example, open root windows more quickly.  Unfortunately, the default VNC method (often gnome) launch a full desktop environment which spawns hundreds of unused processes. 

Ken Herner has written up how to use **IceWM **instead of gnome. We ask that everyone move to this method as it does not bog down our systems. 

[https://wiki.dunescience.org/wiki/DUNE_Computing/Using_VNC_Connections_on_the_dunegpvms](https://wiki.dunescience.org/wiki/DUNE_Computing/Using_VNC_Connections_on_the_dunegpvms)

Describes how to set up the IceWM on your gpvm

And also provides a script from Dom Brailsford  that you can use to set up your VNC system. 

```
source /nashome/d/dbrailsf/setupVNC.sh
```


## Spack updates for LArSoft and Phlex

There has been a lot of work on spack builds for DUNE software for use on AL9.  Please join the [#spack](https://dunescience.slack.com/archives/C06M2R1KE5V/p1771279965572669) channel in Slack for frequent updates and to report issues.  We are now up to v1.1 for spack itself and 0_2_0 for Phlex.   For convenience, there are generic setups but they point to versioned instances.


#### To get `larsoft`

~~~
source /cvmfs/dune.opensciencegrid.org/spack/setup-env.sh
echo "Activate dune-prototype"
spack env activate dune-prototype
~~~


#### To get `phlex` (our new framework for testing)

~~~
source /cvmfs/dune.opensciencegrid.org/spack/setup-env.sh
echo "Activate dune-phlex-prototype"
# currently phlex-0_2_0-prototype
spack env activate dune-phlex-prototype
~~~



## Upcoming changes


### InCommon certificate authority change deadline extended to July

Most host certificates in the United States institutions are currently issued by InCommon.

InCommon has recently announced they will be using a different back-end certificate provider called CertiNext, no later than July.  The schedule for Fermilab to migrate to this backend has not yet been finalized.  In the interim time period it is still possible to get a certificate that can be used as a TLS Web Client.

 We had reached out to 13 compute sites and several storage elements which still only take certificates.  All but 3 of them have converted to tokens now.  We will also complete the transition of the internals of the DUNE Rucio server, several machines in the DUNE data ingest pipeline, and the GlideinWMS frontend to no longer rely on the InCommon certificates as clients, with the goal of finishing this work by July 2026.


### Future group level priorities for batch jobs

Users can currently run jobs with a fair-share priority.  But we often find several people performing similar tasks at large scale and then storing the results, uncataloged, in personal areas.  To preserve resources we plan to move to a tiered priority system where people acting on behalf of physics groups or the production group will have higher priority than individuals. Individuals can still submit their own jobs but will find they run faster if they collaborate within their physics groups.  See [Andrew McNab’s talk](https://indico.fnal.gov/event/69460/contributions/328872/attachments/193538/268427/20251120-mcnab-crab-htcondor.pdf ) for a brief explanation.  Implementation will occur over the next few months. 


## Updates and reminders from previous months


### Project Genesis Information

DOE has announced a new funding opportunity for the Genesis Mission:

NOFO: DE-FOA-0003612 

[https://science.osti.gov/-/media/grants/pdf/foas/2026/DE-FOA-0003612.pdf](https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fscience.osti.gov%2F-%2Fmedia%2Fgrants%2Fpdf%2Ffoas%2F2026%2FDE-FOA-0003612.pdf&data=05%7C02%7CHeidi.Schellman%40oregonstate.edu%7C4f90549b92294c789da808de88fb661f%7Cce6d05e13c5e4d6287a84c4a2713c113%7C0%7C0%7C639098810673922637%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=uR6iTv2DvYpz5WGtU3hUui4%2Fhb7uTSURJh1pYF2EBzk%3D&reserved=0) 

The deadline has passed for Phase 1 but people need to be thinking about Phase 2 

Genesis Mission Q&A from DOE: 

[https://science.osti.gov/-/media/grants/pdf/foas-resources/2026/Genesis-Mission-RFA-FAQs-20260317.pdf](https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fscience.osti.gov%2F-%2Fmedia%2Fgrants%2Fpdf%2Ffoas-resources%2F2026%2FGenesis-Mission-RFA-FAQs-20260317.pdf&data=05%7C02%7CHeidi.Schellman%40oregonstate.edu%7C4f90549b92294c789da808de88fb661f%7Cce6d05e13c5e4d6287a84c4a2713c113%7C0%7C0%7C639098810673993725%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=Z%2FjeCP7vaDO91sdFc%2F6u57EcupQFYGOI8wpDOrIcNZg%3D&reserved=0) 

We will continue discussion and coordination of Genesis Mission proposals through the DUNE AI/ML Forum:

[https://indico.fnal.gov/category/1676/](https://indico.fnal.gov/category/1676/)

```
DUNE Slack: ai-ml 
Mailing list: dune-ai-ml
DUNE AI/ML forum bi-weekly meeting: **Mondays at 10:00 AM CT**
Co-chairs: Jianming Bian (bianjm@uci.edu) and Leigh Whitehead (leigh.howard.whitehead@cern.ch)
```

### Report from the Joint DUNE AI/ML and CS&S workshop 

Held March 10–12 at Rice's BioScience Research Collaborative, the three-day workshop ([https://indico.fnal.gov/event/72868/](https://indico.fnal.gov/event/72868/)) explored how the CS&SC consortium can better support the growing role of AI and ML in DUNE. On Day 1, participants reviewed the upcoming physics goals of the experiment and learned how the various working groups are incorporating new AI/ML trends into DUNE's toolkits. Day 2 focused on available computing resources (GPUs), future plans to expand them, support for AI/ML workflows, and how large language models are being explored within DUNE. On the final day, participants examined emerging topics, from foundation models to differential programming and concluded by summarizing the workshop's key action items.


### **Reminder: Official Datasets**

The Production Group makes official datasets.  The Rice group has created a website for finding them. There are also command line tools for exploring further.  See [the tutorial ](https://dune.github.io/computing-basics/03-data-management/index.html#official-datasets-) for details or go straight to the [website](https://dune-tech.rice.edu/dunecatalog/) to find your samples.


### **Reminder of Wednesday down times**

A reminder that the Fermilab compute nodes and disk servers undergo monthly maintenance on the 3rd Wednesday of each month. Systems are partially unavailable for 3-6 hours, which leads to things not working.  


### **Using SL7**

Just a reminder that running larsoft still requires Scientific Linux 7 in a container.  You can find sample scripts for setting up your container [here](https://dune.github.io/computing-basics/sl7_setup). 


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
