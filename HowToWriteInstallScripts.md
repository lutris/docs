# Introduction 

Lutris install scripts are written in the [YAML](http://yaml.org/) format. It's a format similar to JSON or XML but meant to be easier to read and to write. If you are familiar with [Ansible](https://www.ansible.com/) playbooks then you should grasp how they work very quickly and if not, it's still pretty simple to understand.

While we call them scripts, they are very linear and lack complex structures of programming languages such as loops, conditions or variables. This makes the process easy to follow but doesn't give you a lot of flexibility.

# General guidelines 

## Editing scripts 
Install scripts are freely editable by any registered user. Any edits made to the scripts are saved as revisions which will go through moderation before being published. This means that the currently available script and the one you modified are not the same and won't be until going through moderation. You can test your current draft by clicking the "Test this installer" button next to the Submit button (the button is displayed only if you are viewing a draft).

## Forking scripts 
Scripts can be forked to other games (or even the same one), this will copy the whole script to a new one and can be useful when creating a script that is similar to another one. Please don't fork scripts if the target script has the same goal as the source (same game, same runner, same purpose). If you need to modify the behavior of a script, just do it on the original one. 


# Sections 

Scripts are divided into several sections, most of them are optional but you need to have at least a <code>game:</code> section. E.g.:
```
 game:
   exe: path/to/game/executable
```   

**Note:** The `game:` section isn't a requirement for all runners. Some, like the Web and Browser runners, use `main_file: https://url.com/url` in which case the game section isn't needed.

# Documentation 

Detailed documentation about writing installers can be found at https://github.com/lutris/lutris/blob/master/docs/installers.rst
