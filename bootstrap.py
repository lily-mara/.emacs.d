#!/usr/bin/env python3

import subprocess
import os

plugins = [
		'edwtjo/evil-org-mode',
		'technomancy/package.el',
		'natemara/ahk-mode',
		'timcharper/evil-surround'
]

def main():
	clone_all_plugins()

def full_url(url):
		url_beginnings = ['http', 'git://', 'ssh://', 'https://']
		fully_qualified = any((url.startswith(i) for i in url_beginnings))
		github = 'https://github.com'

		if fully_qualified:
				return url
		
		if url.startswith('/'):
				return github + url

		return github + '/' + url
		
def clone_all_plugins():
		home = os.path.expanduser('~')
		plugins_dir = os.path.join(home, '.emacs.d', 'plugins')
		if not os.path.exists(plugins_dir):
				os.mkdir(plugins_dir)

		for plugin in plugins:
				plugin_name = plugin.split('/')[-1:][0]
				clone_path = os.path.join(plugins_dir, plugin_name)
				command = ['git', 'clone', full_url(plugin), clone_path]
				subprocess.call(command)

if __name__ == '__main__':
	main()
