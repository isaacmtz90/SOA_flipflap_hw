# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  NEWLINE = "\n".freeze
  TAB = "\t".freeze
  def take_tsv(input_tsv)
    @data = tsv_to_hash input_tsv
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    array = [data.first.keys] + data.map(&:values)
    array.map { |row| row.join(TAB) + NEWLINE }.join
  end

  def line_to_hash(headers, line)
    headers.zip(line.split(TAB)).to_h
  end

  def tsv_to_hash(tsv)
    lines = tsv.split(NEWLINE)
    headers = lines.first.split(TAB)
    result = lines.map { |line| line_to_hash(headers, line) }
    result.drop(1)
  end
end
