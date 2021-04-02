@echo off
wmic process where "name = 'vim.exe'" delete
wmic process where "name = 'python.exe'" delete
