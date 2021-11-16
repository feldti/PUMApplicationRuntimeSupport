# PUMApplicationRuntimeSupport

All packages needed for PUM applications - packages offering runtime support for PUM oriented apps. PUM is a model oriented source code generator. It creates
domain model (to be stored within Gemstone) and API definitions (with its corresponding parameter and result classes.

With that information the system generates application source code for Gemstone/Topaz Smalltalk, Python, C#, Java and Sencha ExtJS (Javascript) to access the API definitions.

Originally the base for this code was based on the swagger project, now known as OpenAPI. Even though, these helper calasses are still needed, there is no support for OpenAPI now included. THe helper classes are now used with Smalltalk for metaaccessing the API and store information about the model and its documentation
