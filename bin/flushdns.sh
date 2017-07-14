#!/bin/bash
dscacheutil -flushcache
killall -HUP mDNSResponder
say cache flushed
