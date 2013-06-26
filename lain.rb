# coding: utf-8
require 'rubygems'
require 'bundler/setup'
Bundler.require

post '/pushed' do
  data = JSON.parse(params["payload"]) rescue nil
  return if data.nil?
  CarrierPigeon.send(
    :uri => # "irc://lainbot@irc.hoge.com:9999/#room",
    :channel_password => "xxxxxxxxxxx",
    :message => data["user"] + "が" +
                data["repository"]["name"] + "/" + data["commits"][0]["branch"] +
                "にpushしたよ",
    :ssl => false,
    :join => true
  )
end
