# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  require 'csv'
  NEWLINE = "\n".freeze
  TAB = "\t".freeze
  def take_tsv(input_tsv)
    @data = CSV.parse(input_tsv, col_sep: TAB, headers: true).map(&:to_hash)
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    array = [data.first.keys] + data.map(&:values)
    array.map { |row| row.join(TAB) + NEWLINE }.join
  end
end
