---
layout: post
title:  "A PowerShell script to implement a git feature branch workflow integrated with PivotalTracker"
date:   2015-10-04 02:10:30
categories: powershell git pivotaltracker
comments: true
---
ps-git-pivotal
=====
PowerShell script to implement a git feature branch workflow integrated with [PivotalTracker][1], heavily based on [git-pivotal][2].
You will need the git command in your path.

#Usage
Inside your git repository run the following commands. The script will ask for some config values in the first run, your PivotalTracker API token (you can find it in your profile page) the other config is the project id.

Start-Story
-----------
This command will list the top 5 stories in your PivotalTracker backlog and ask for a story id to start work on, after you choose an id a branch will be created and the story on pivotal will change to started.
After that you can do your current work and commits as always.

Stop-Story
----------
After you´re done run this command to merge the current branch into master, mark the story as finished in PivotalTracker and delete the created feature branch. 

#Installing (manual)
Grab a version of the script [ps-git-pivotal.psm1][3] and put inside the PowerShell modules path within a folder named ps-git-pivotal. You can check the path with the PSModulePath environment variable.
```
$env:PSModulePath
```
As always you can fork and clone the repository inside the PowerShell modules path it will work too.

[1]: https://www.pivotaltracker.com/
[2]: https://github.com/trydionel/git-pivotal
[3]: https://github.com/marciotoshio/ps-git-pivotal/raw/master/ps-git-pivotal.psm1

<a href="https://github.com/marciotoshio/ps-git-pivotal/"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://camo.githubusercontent.com/652c5b9acfaddf3a9c326fa6bde407b87f7be0f4/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f6f72616e67655f6666373630302e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_orange_ff7600.png"></a>