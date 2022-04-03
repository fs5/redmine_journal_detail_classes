require 'redmine'

require_relative './lib/model_journal_patches'

Redmine::Plugin.register :redmine_journal_detail_classes do
  name 'redmine journal detail classes'
  author 'Frank Schwarz'
  description 'Extra CSS classes for journal entries'
  version '0.0.1.dev'
  url 'https://github.com/fs5/redmine_journal_detail_classes'
end
