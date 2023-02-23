fx_version 'cerulean'
game 'gta5'

description 'Diesel Hack'
version '1.0.0'

author 'NT Diesel#4486'

shared_script 'config.lua'

client_scripts {
    'client/main.lua',
}

server_scripts {
    'server/main.lua'
}

lua54 'yes'

ui_page 'dist/index.html'

files {
	"dist/index.html",
	"dist/assets/*.js",
	"dist/assets/*.css",
    "dist/*.ogg"
}