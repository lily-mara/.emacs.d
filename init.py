import subprocess
import os

plugins = [
		'edwtjo/evil-org-mode'
]

def full_url(url):
		url_beginnings = ['http', 'git://', 'ssh://', 'https://']
		fully_qualified = any((url.startswith(i) for i in url_beginnings))
		github = 'https://github.com'

		if fully_qualified:
				return url
		
		if url.startswith('/'):
				return github + url

		return github + '/' + url
		
def clone_all_plugins(plugins):
		home = os.path.expanduser('~')
		plugins_dir = os.path.join(home, '.emacs.d', 'plugins')
		if not os.path.ispath(plugins_dir):
				os.mkdir(plugins_dir)

		for plugin in plugins:
				plugin_name = plugin.split('/')[-1:][0]
				clone_path = plugins_dir + plugin_name
				command = ['git', 'clone', full_url(plugin), clone_path]
				subprocess.call(command)
				print('Cloning {0}'.format(plugin_name))
