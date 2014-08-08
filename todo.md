# Doing
* chkconfig

# To Do 
## New checks to write
* Puppet 
* dmidecode
* Mail (queue, spooled, configuration)
* Storage - replication, show_disks, emcgrab
* Filesystems - inodes, size, large directories? 
* Detailed CPU state - WIO/USR/SYS 
* VxVM - vxprint, vxstat, vxdisk list 
* Memory - physical, virtual, high usage, paging 
* Networking - multipathing, duplex, speed 
* Explorers/SOS reports 
* Packages/Patches 
* Linux LVM 
* LDOMs/Containers 
* NTP
* Metastat 
* ipmi query?
* *lom query?
* NFS client info (nfsstat)
* Shared memory 
* sysdef -i
* Lock Contention (mutex, adaptive, read/write)
* nscd/nslcd
* Cluster - hastatus, llt, gab, check against auto check script, recent events? 
* Hostinfo output
* Patrol - dumphist, config, parameters from threshold site, is it working?

## External data
* Recent RAT sessions on the box
* Open INCs - pull from RePrioritise 
* SUDO attempts/commands 

## Infrastructure tasks
* Checksums
* Create a cvs/git/svn repo
* Should we filter the outputs into standard formats?
* Recent changes on the hosts 
* Vendor call specific modes?
* Where do we store the files on the local hosts?
* How long do we store the files on the local host?
* Code a pull system to bring back indivdiual / fleet wide scans
* Custom data collection modes for long term performance analysis
* How do we handle hanging scripts?
* How do we address additional load - heisenburg principle
* Packaging of the check
* Analytics of how long it takes to run 
* Patrol recovery action -> log file monitor -> BEM -> pull state centrally 
* Scheduled mode - 1200 & 0000
* Scan the gathered files for potential errors/warnings 
* Enable process accounting for in depth performance analysis

# Done
* List which nfs exports are being used on each host 
* Linux specific checks 
* Error checking in the scripts
* What gets run at what level?
* Sort out the ticket creation functions
* Make a better *lib
* Crontab 
* Move away from a monolythic file 
* fmd 
* Logging and debugging info
* At jobs 
* How does Pete to the server checks for auditing certain configs?
* sysctl -a
* /etc/system
* Semaphores
* Copy full configs (/etc) 
* ARP
