require 'time'

class ArchivesSpaceService < Sinatra::Base

  Endpoint.post('/repositories/:repo_id/plugins/generate_accession_identifiers')
    .description("Initialize the bhl_accession_identifier Sequence")
    .params(["value", Integer, "The value with which the Sequence will be initialized"],
            ["repo_id", :repo_id])
    .permissions([:manage_repository])
    .returns([200, "OK"]) \
  do
    Sequence.init("bhl_accession_identifier", params[:value])
  end

  Endpoint.post('/repositories/:repo_id/plugins/generate_accession_identifiers/next')
    .description("Generate a new incremented accession number")
    .params(["repo_id", :repo_id])
    .permissions([:update_accession_record])
    .returns([200, "{'number', N}"]) \
  do
    number = Sequence.get("bhl_accession_identifier")

    json_response(:number => number)
  end

  Endpoint.post('/repositories/:repo_id/plugins/generate_resource_identifiers')
    .description("Initialize the bhl_resource_identifier Sequence")
    .params(["value", Integer, "The value with which the Sequence will be initialized"],
            ["repo_id", :repo_id])
    .permissions([:manage_repository])
    .returns([200, "OK"]) \
  do
    year = Time.now.strftime('%Y')
    sequence_name = "bhl_resource_identifier_#{year}"
    Sequence.init(sequence_name, params[:value])
  end

  Endpoint.post('/repositories/:repo_id/plugins/generate_resource_identifiers/next')
    .description("Generate a new identifier based on the year and a running number")
    .params(["repo_id", :repo_id])
    .permissions([:update_resource_record])
    .returns([200, "{'year', 'YYYY', 'number', N}"]) \
  do
    year = Time.now.strftime('%Y')
    sequence_name = "bhl_resource_identifier_#{year}"
    number = Sequence.get(sequence_name)

    # Increment the Sequence again so that it starts at 1
    if number == 0
      number = Sequence.get(sequence_name)
    end

    json_response(:year => year, :number => number)
  end

end
