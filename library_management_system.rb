require 'json'

def save_data(data, filename)
  data_to_save = data.map(&:to_h) # Convert each object to a hash
  File.write(filename, JSON.generate(data_to_save))
end

def load_data(filename)
  if File.exist?(filename)
    json_data = File.read(filename)
    JSON.parse(json_data)
  else
    # Handle the case when the file is missing
    []
  end
end
