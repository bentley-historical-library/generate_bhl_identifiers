class SequenceUpdater

  def self.update(sequence, value)
    DB.open(true) do |db|

      1000.times do
        updated_count = db[:sequence].filter(:sequence_name => sequence.to_s).update(:value => value)

        if updated_count == 0
          sleep(0.01)
        elsif updated_count == 1
          return value
        else
          raise SequenceError.new("Unrecognised response from SQL update when generating next element in sequence '#{sequence}': #{updated_count}")
        end
      end
    end
  end

end