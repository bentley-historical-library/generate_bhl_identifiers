This plugin is a slightly modified version of the generate_accession_identifiers plugin that ships with ArchivesSpace.
It autogenerates accession identifiers (the next sequential number) and resource identifiers (the current year followed by the next sequential three digit number)

The first time this is used, we'll need to initiate the sequences as follows:

insert into sequence (sequence_name, value) values ('bhl_accession_identifier', CURRENT_MAX_ACCESSIONID), ('bhl_resource_identifier', CURRENT_MAX_RESOURCEID);

This plugin adds automatic identifier generation to the "Create
Accession" form.  The form will default to an identifier such as:

  YYYY NNN

Where YYYY is the current year, and NNN is a sequence number.

To install, just activate the plugin in your config/config.rb file by
including an entry such as:

     AppConfig[:plugins] = ['generate-accession-identifiers-plugin']
