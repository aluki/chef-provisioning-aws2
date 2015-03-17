require 'chef/provisioning/driver'
require 'aws-sdk'

class Chef
 module Provisioning::Aws2

  class Driver < Chef::Provisioning::Driver

   def self.from_url(url, config) 
    Driver.new url, config
   end

   def initialize(url, config)
    raise 'Driver url must be aws2:<profile>' unless url.start_with? "aws2:"
    config[:profile] = url.split(':')[1]
    config.inspect
    super
   end

   def c
    credentials
   end

   private
  
   def credentials
    return [ config[:access_key_id], config[:secret_access_key] ] if config.has_key?(:access_key_id) and config.has_key?(:secret_access_key)
    sc = Aws::SharedCredentials.new profile_name: config[:profile]
    [ sc.access_key_id, sc.secret_access_key ] if sc.loadable?
    
   end  
 
  end
 end
end
