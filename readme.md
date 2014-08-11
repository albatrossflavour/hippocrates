hippocrates
===========

Hippocrates is a framework for carrying out health, performance and compliance checks on a host.


# Overview

Hippocrates is designed to automagically gather host health, performance and complaince information and store it in a defined framework.  It is ***NOT*** designed to be a monitoring, capacity reporting or configuration management  system.  Hippocrates should be used when you have an issue on a range of machines and want to gather defined information from these machines.

Our experience is that we're often asked to give a *'health check'* on a host, but that means different things to different people.  The framework will carry out an agreed set of tasks and can be done much quicker than manually gathering it.  This includes extracting data from monitoring systems, the host, CMDB, ticketing systems etc.

Using a defined naming convention for the check scripts, it is possible to have multiple levels of checks and multiple types of checks defined.

The data is collected in a defined directory structure and can be tagged with a ticket number if appropriate.

The system has been designed to work with Soalaris, Linux, Darwin and hook into BMC Patrol, BMC Remedy, ORCA
