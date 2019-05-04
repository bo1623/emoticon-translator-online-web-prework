require "yaml"
require "pry"

def load_library(path)
  lib=YAML.load_file(path)
  new_hash={"get_meaning"=>{},"get_emoticon"=>{}}
  lib.each do |name,emots|
    new_hash["get_meaning"][emots[1]]=name
    new_hash["get_emoticon"][emots[0]]=emots[1]
  end
  new_hash
end

def get_japanese_emoticon(path,emot)
  lib=load_library(path)
  if lib["get_emoticon"][emot]!=nil
    return lib["get_emoticon"][emot]
  else
    return "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(path,emot)
  lib=load_library(path)
  if lib["get_meaning"][emot]!=nil
    return lib["get_meaning"][emot]
  else
    return "Sorry, that emoticon was not found"
  end
end
