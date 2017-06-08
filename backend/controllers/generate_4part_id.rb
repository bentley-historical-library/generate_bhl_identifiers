require 'time'

class ArchivesSpaceService < Sinatra::Base

  Endpoint.post('/plugins/generate_accession_identifiers')
    .description("Initialize the bhl_accession_identifier Sequence")
    .params(["value", Integer, "The value with which the Sequence will be initialized"])
    .permissions([:update_accession_record])
    .returns([200, "OK"]) \
  do
    Sequence.init("bhl_accession_identifier", params[:value])
  end

  Endpoint.post('/plugins/generate_accession_identifiers/next')
    .description("Generate a new incremented accession number")
    .params()
    .permissions([:update_accession_record])
    .returns([200, "{'number', N}"]) \
  do
    number = Sequence.get("bhl_accession_identifier")

    json_response(:number => number)
  end

  Endpoint.post('/plugins/generate_resource_identifiers')
    .description("Initialize the bhl_resource_identifier Sequence")
    .params(["value", Integer, "The value with which the Sequence will be initialized"])
    .permissions([:update_resource_record])
    .returns([200, "OK"]) \
  do
    year = Time.now.strftime('%Y')
    sequence_name = 'bhl_resource_identifer_#{year}'
    Sequence.init(sequence_name, params[:value])
  end

  Endpoint.post('/plugins/generate_resource_identifiers/next')
    .description("Generate a new identifier based on the year and a running number")
    .params()
    .permissions([:update_resource_record])
    .returns([200, "{'year', 'YYYY', 'number', N}"]) \
  do
    year = Time.now.strftime('%Y')
    number = Sequence.get("bhl_resource_identifier_#{year}")
    if number == 0
      number = 1
    end

    json_response(:year => year, :number => number)
  end

end
