# MetaMan Software Specification

MetaMan is a system-wide metadata manager for ResearchLake. It is designed to reside either remotely or locally as a service. Its primary function is to serve as a concurrent repository of metadata capable of integrating to other pieces of software in order to provide direct, non-hierarchical referentiality. MetaMan can also be queried independently using a Command Line Interface (CLI) application provided within ResearchLake.

## Functions

Functions querying single pieces of data:

* **put(context, application, uuid, content):** store a piece of metadata if it not conflicting with existing content
* **get(context, application, uuid):** obtain a piece of metadata using a UUID(3 within the context of an application
* **test(context, application, uuid):** test whether a given piece of metadata exists for a given application
* **del(context, application, uuid, trim/notrim):** remove all metadata with given UUID across one application
* **fix(context, application, uuid, content):** fix the metadata in app

Functions querying multiple pieces of data:

* **ancestors(context,application, uuid):** find any ancestors across a given application for which an uuid is an annotation recursively
* **progeny(context,application, uuid):** find any progeny across a given application for which an uuid is an annotation recursively
* **similar(context, application, content, dist):** find all metadata similar to content within distant dist
* **all(context, application):** retrieve all metadata for a context and/or application

 
## Components
