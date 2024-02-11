# frozen_string_literal: true

class UserProfile < ApplicationRecord
  NOT_ALLOWED_USERNAMES = %w[
    abuse admin administrator autoconfig broadcasthost ftp hostmaster imap info is isatap it
    localdomain localhost mail mailer-daemon marketing mis news nobody noc noreply no-reply pop pop3 postmaster root
    sales security smtp ssladmin ssladministrator sslwebmaster support sysadmin usenet uucp webmaster wpad www
  ].freeze
  USERNAME_REGEX = /\A[a-z]([a-z0-9-]*[a-z0-9])?\z/

  belongs_to :user

  validates :display_name, presence: true
  validates :username, presence: true

  validates :username, uniqueness: { case_sensitive: false }

  validates :username, format: { with: USERNAME_REGEX }

  validates :username, exclusion: { in: NOT_ALLOWED_USERNAMES }
end
