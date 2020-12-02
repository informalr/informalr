# informalr

Branch   |GitHub Actions                                                                                       |[![Codecov logo](man/figures/Codecov.png)](https://www.codecov.io)
---------|-----------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------
`master` |![R-CMD-check](https://github.com/informalr/informalr/workflows/R-CMD-check/badge.svg?branch=master) |[![codecov.io](https://codecov.io/github/informalr/informalr/coverage.svg?branch=master)](https://codecov.io/github/informalr/informalr/branch/master)
`develop`|![R-CMD-check](https://github.com/informalr/informalr/workflows/R-CMD-check/badge.svg?branch=develop)|[![codecov.io](https://codecov.io/github/informalr/informalr/coverage.svg?branch=develop)](https://codecov.io/github/informalr/informalr/branch/develop)
`alexine`|![R-CMD-check](https://github.com/informalr/informalr/workflows/R-CMD-check/badge.svg?branch=alexine)|[![codecov.io](https://codecov.io/github/informalr/informalr/coverage.svg?branch=alexine)](https://codecov.io/github/informalr/informalr/branch/alexine)
`bara`   |![R-CMD-check](https://github.com/informalr/informalr/workflows/R-CMD-check/badge.svg?branch=bara)   |[![codecov.io](https://codecov.io/github/informalr/informalr/coverage.svg?branch=bara)](https://codecov.io/github/informalr/informalr/branch/bara)
`claudio`|![R-CMD-check](https://github.com/informalr/informalr/workflows/R-CMD-check/badge.svg?branch=claudio)|[![codecov.io](https://codecov.io/github/informalr/informalr/coverage.svg?branch=claudio)](https://codecov.io/github/informalr/informalr/branch/claudio)
`frans`  |![R-CMD-check](https://github.com/informalr/informalr/workflows/R-CMD-check/badge.svg?branch=frans)  |[![codecov.io](https://codecov.io/github/informalr/informalr/coverage.svg?branch=frans)](https://codecov.io/github/informalr/informalr/branch/frans)
`geert`  |![R-CMD-check](https://github.com/informalr/informalr/workflows/R-CMD-check/badge.svg?branch=geert)  |[![codecov.io](https://codecov.io/github/informalr/informalr/coverage.svg?branch=geert)](https://codecov.io/github/informalr/informalr/branch/geert)
`jan`    |![R-CMD-check](https://github.com/informalr/informalr/workflows/R-CMD-check/badge.svg?branch=jan)    |[![codecov.io](https://codecov.io/github/informalr/informalr/coverage.svg?branch=jan)](https://codecov.io/github/informalr/informalr/branch/jan)
`richel` |![R-CMD-check](https://github.com/informalr/informalr/workflows/R-CMD-check/badge.svg?branch=richel) |[![codecov.io](https://codecov.io/github/informalr/informalr/coverage.svg?branch=richel)](https://codecov.io/github/informalr/informalr/branch/richel)
`stefano`|![R-CMD-check](https://github.com/informalr/informalr/workflows/R-CMD-check/badge.svg?branch=stefano)|[![codecov.io](https://codecov.io/github/informalr/informalr/coverage.svg?branch=stefano)](https://codecov.io/github/informalr/informalr/branch/stefano)
`willy`  |![R-CMD-check](https://github.com/informalr/informalr/workflows/R-CMD-check/badge.svg?branch=willy)  |[![codecov.io](https://codecov.io/github/informalr/informalr/coverage.svg?branch=willy)](https://codecov.io/github/informalr/informalr/branch/willy)

 * Branches are ordered `master`, `develop`, then topic branches alphabetically

The `informalr` R team!

![informalr logo](man/figures/informalr_logo.png)

## Project

Hiking guide to help hikers spot busy routes/stops before they embark on a hike. 
This show a somehow similar idea:

![](project.png)

This is a stub of something more tailored to ours:

![](bike_app_stub.png)

## Team

Ordered alphabetically on first name:

Name                                         |Role
---------------------------------------------|-----------------
[Alexine](https://github.com/alexinedewit)   |Junior
[Bara](https://github.com/barawaclawik)      |Newbie
[Claudio](https://github.com/janclod)        |Junior, front-end
[Frans](https://github.com/fransbianchi)     |Junior
[Geert](https://github.com/bogeert)          |Junior, back-end
[Jan](https://github.com/janderkkotlarski)   |Newbie
[Lizzie](https://github.com/Lizzie-Roeble)   |Newbie
[Pamela](https://github.com/Pamgd29)         |Newbie
[Richel](https://github.com/richelbilderbeek)|Team leader
[Stefano](https://github.com/swom)           |Newbie 
[Willy](https://github.com/FrieseWoudloper)  |Medior

## Meetings

 * Date: Tuesday August 25 2020, then every Tuesday
 * Time: 18:00-20:00
 * Where IRL: meeting room 5171.0708, Linnaeusborg, Zernike
 * Where online: Discord.

![](linneausborg_annotated.png)

> Map of the Linneausborg. [1] main entrance [2] meeting room 5171.0708

We follow this timetable:

What                     | Time
-------------------------|------
Richel @ LB main entrance|18:00
Doors open               |18:05
Work starts [1]          |18:15
Break time!              |19:00
Work continues           |19:15
End of lesson            |20:00

 * [1] First thing to do: merge `develop` to your branch, then push your branch

## Coding via Discord

For those that prefer online, we use Discord to chat.
To join, send Richel a Discord Friend Request: `richelbilderbeek#9002`. Add Pam as well @Pam González#5830.
He'll add you to the `informalr` server.

## Code of Conduct

See [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

In case it is undesirable to email Richel,
contact [Willy](https://github.com/friesewoudloper).

## Long-term schedule

Week|Activity
----|----------
 47 |Code of conduct + code reviews, discover members fit for pair programming
 48 |Pair programming
 49 |.
 50 |.
 51 |.
 52 |Christmas holiday

## FAQ

### What is the goal of `informalr`?

To learn how to develop professionally in a team in an informal setting using R.

### What is meant by 'professionally'?

That we follow the literature, which means we will:

 * Use a package as a development unit (not an R script, not a vignette)
 * Use `git` for version control, where each person has his/her own branch
 * Use GitHub for collaboration
 * Employ test-driven development
 * Use Travis CI for continuous integration
 * Use `lintr` to check for style
 * Use `covr` to check for code coverage
 * Use `goodpractice` for miscellaneous good practices

See, for example, [here](https://github.com/richelbilderbeek/PresentationsAboutR)
for multiple videos we will follow.

### What is meant by 'in a team'?

That we work together.
A beginner will be taught by a more experienced team member.
We will be doing pair programming.

### What is meant by 'informal'?

This means that:

 * You are allowed to grab a beer
 * If you cannot be there, this is always fine
 * We only work during our meetings

### How will we do that?

By working on projects as a team. In practice, we will be writing packages.

### What projects will we be working on?

First, we'll write some trivial packages to get used to the workflow.
After this, the team decides on a project by majority vote.

To be precise, you will learn, in this order:

 * `git` minimal workflow: add, clone, commit, pull, push
 * R package minimum: tests, writing trivial functions by copying existing code
 * `git` branching: checkout, merge
 * R package basic: write simple functions, write vignettes
 * Projects

### What should my minimal level be?

There is none.

### Why does it take so long for a build to start

[Because Travis CI is migrating from .org to .com](https://travis-ci.community/t/build-delays-for-open-source-project/10272/23)

### I am new, what should I do?

  1. Create a Discord account, send Richel a Discord Friend Request: `richelbilderbeek#9002`, so he can add you to the tresinformal Discord group
  2. Create a GitHub account, share it with a team member so he/she can add you to the `informalr` team

Note: if the Issue is closed, re-open it, assign yourself, 
move the Issue to 'In Progress'. Close the Issue after fixing it. Welcome
to our workflow :+1:

  3. Do a trivial `git push` to `master`, [https://github.com/informalr/informalr/issues/11](https://github.com/informalr/informalr/issues/11)
  4. Create your own branch using the GitHub web interface, [https://github.com/informalr/informalr/issues/13](https://github.com/informalr/informalr/issues/13)
  5. Do a trivial `git push` to your branch, [https://github.com/informalr/informalr/issues/15](https://github.com/informalr/informalr/issues/15)
  6. Write your first trivial code, [https://github.com/informalr/informalr/issues/12](https://github.com/informalr/informalr/issues/12)
  7. Write happy-road test for function, [https://github.com/informalr/informalr/issues/31](https://github.com/informalr/informalr/issues/31)
  8. Write the actual function, which assumes correct input, [https://github.com/informalr/informalr/issues/32](https://github.com/informalr/informalr/issues/32)
  9. Write tests for function misuse, [https://github.com/informalr/informalr/issues/34](https://github.com/informalr/informalr/issues/34)
  10. Write the actual function code, for incorrect input, [https://github.com/informalr/informalr/issues/35](https://github.com/informalr/informalr/issues/35)
  11. Add a textual datafile to `inst/extdata`, [https://github.com/informalr/informalr/issues/36](https://github.com/informalr/informalr/issues/36)

### I work on the hiking app, what should I do?

Golden rules:

 * Whatever you work on, always be assigned to an Issue
 * Whatever code you develop, always be working to fix a test
 * If all tests pass, we are -by definition- happy.

You start out as a junior and gradually move up to medior.

#### Junior

Do some simple Issues to get to know the project.
These are labeled 'Good First Issue'.
These Issues have a test that needs to be fixed.

If there are no such Issues, create an Issue for `richelbilderbeek` to add these :+1:

#### Medior

  * Do some harder Issues. These Issues may or may not have a test yet. 
    If there is no test, write that test first and have it reviewed.
  * Create an Issue with a new feature. 
    Write down the test in the Issue.
    After this, you can assign yourself to this new Issue.

#### Open data sources
* [Public transport data NDOV loket](https://data.ndovloket.nl/)
* [OpenStreetMap Overpass API](https://overpass-turbo.eu/)
* [Nationaal Dataportaal Wegverkeer](http://opendata.ndw.nu/),
  or [https://www.ndw.nu/pagina/en/78/database](https://www.ndw.nu/pagina/en/78/database)
  or [https://www.ndw.nu/pagina/en/78/database/79/real-time_traffic_data/](https://www.ndw.nu/pagina/en/78/database/79/real-time_traffic_data/)

#### Related projects

 * Object Detection with YOLO and MobileNet SSD: https://github.com/dannylee1020/object-detection-app
 * Realtime bus dashboard: https://shiny.rstudio.com/gallery/bus-dashboard.html
 * Source code: https://github.com/rstudio/shiny-examples/tree/master/086-bus-dashboard

### Misc

 * Shiny tutorial: https://github.com/FrieseWoudloper/shiny-workshop

## Progress

### 2020-11-24

![](man/figures/20201124.png)

### 2020-10-27

Video: [YouTube](https://youtu.be/Pc1e-9WiDuM) [Download](http://richelbilderbeek.nl/informalr_20201027.ogv)


