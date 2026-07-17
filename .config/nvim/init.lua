require 'config.general'
require 'config.mappings'
require 'config.lazy'
require 'config.misc'

-- Source a local configuration file it exists.
local utils = require 'utils'
utils.source_if_exists 'init.local.lua'
