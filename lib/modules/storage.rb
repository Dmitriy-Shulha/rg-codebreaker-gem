require 'fileutils'
require 'psych'

module Storage
  def save(object, filepath)
    FileUtils.mkdir_p File.dirname(filepath)
    dump_of_object = Psych.dump(object)
    File.open(filepath, 'w') do |file|
      file.write dump_of_object
    end
  end

  def load(filepath)
    file = File.read(filepath)
    Psych.safe_load(file, [Symbol, Game, Statistics], [], true)
  end
end
