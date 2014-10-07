$LOAD_PATH << File.expand_path('../lib', __FILE__)

def fixture_path(filename)
  File.expand_path(File.join("fixtures", filename), File.dirname(__FILE__))
end

def read_fixture(filename)
  File.open(fixture_path(filename))
end
