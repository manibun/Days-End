Introduction
Like dynamic traits? I sure do! I've been a long time user of the dynamic traits mod, but over time I feel it's started to make less and less sense. Eventually I got fed up and tore that mod apart from the inside out, changing things to make more sense as well as to remove a lot of unnecessary mechanics that only serve to over-complicate the trait gaining and losing process. This is the result, below I'll document exactly what and how this mod does what it does, and a copy of this entire description is included as a txt file within the mod itself should you need it. I'll do my best to explain my reasoning for the changes made. Credit to PepperCat for creating the original mod before I stuck my grubby hands all over it.

New traits added by this mod

'Nightmares' a +3 negative trait available at char creation, does what it says, when sleeping you have an increased chance to occasionally awake from a night terror gaining panic and stress. You will know when you have awoken from a nightmare caused by this trait as opposed to a vanilla nightmare, in that nightmares caused by the nightmares trait also max out your wetness upon waking up.

'Pluviophobia' and 'Pluviophile' are +2 and -2 traits respectively and relate to mood during the rain. When it's raining a Pluviophobe will have their mood decreased, and even moreso if they are outside. A pluviophile will experience the exact opposite.

'Alcoholic' is a +8 trait, pretty self explanatory but I will get into more detail about it later

'Active' and 'Sedentary' serve as augments to exercise efficiency, they cannot be selected at char creation but rather are applied later via the health system. Sedentary causes pain when exercising and when swinging weapons. Active on the other hand increases your mental state when you do these actions, decreasing stress, unhappiness, and boredom.

'Ametuar Electrician' -3 skill, lets you use generators without having to read the book.

Removed traits from the original mod

'Anorexy' has been removed completely, as the way it was implemented made no sense. Weight loss is a symptom of anorexia, not the other way around, not to mention it's not even spelled right.

'Bloodlust' has been removed completely, killing lots of zombies doesn't somehow make your mood dependent on killing more zombies.This trait screwed up the whole bravery progression tiers by adding a weird negative trait on the end that isn't even realistic.

'Prodigy' has been removed because it didn't seem very necessary and didn't add a lot, as the sedentary and active traits already serve as traits that augment exercise efficiency.

'Flimsy and Frail' are removed because in my opinion they were too large a punishment for underweight characters, and very underweight characters would often have issues even wearing heavy layers of clothing like jackets without becoming overencumbered.

Now for the good stuff :)
Something the original mod also lacked was very much documentation, a lot of the mechanics were only knowable by digging around in the mod files themselves, so I'm going to do my best to give as much information as possible so you know what you are downloading.

This mod contains five separate systems for gaining and losing traits. I will discuss each in detail, listed from systems that handle the most traits to the least traits they are:

The Skill System: A check is made any time a player increases any skill by one level, and appropriate traits are added and removed as necessary based on player skill values

Health System: A check is made for each player at the top of every hour, and appropriate traits are added and removed according to a combination of the player's weight, as well as their fitness and strength skills. Take care of your body, and your body will take care of you!

Kills System: A check is made every time a player kills a zombie, appropriate traits are added or removed based on the total zombies killed for that player.

The Mood System: Only handles two traits, (sleepyhead & insomniac) so it checks much more frequently, adds and removes traits based on your unhappiness level.

The Addiction System: Also only handles two traits, (alcoholic & smoker) works independently with its own counter to measure things, updates every hour.

Let's discuss each in detail.

THE SKILL SYSTEM
There are two kinds of conditions in this system, skill specific traits, and skill category specific traits.
Negative skills are only removed if you have them, otherwise nothing happens.
If you already have a positive trait attempting to be added, nothing happens.

SKILL SPECIFIC TRAITS:-------------------------------------------------------------------------------------------------

Clumsy is removed when the player's lightfoot increases to 3

Graceful is added when the player's lightfoot increases to 7

Conspicuous is removed then the player's sneak increases to 3

Inconspicuous is added when the player's sneak increases to 7

All Thumbs is removed when the player's nimble increases to 3

Dexterous is added when the player's nimble increases to 7

Axeman is added when the player's axe increases to 8

Handy is added when the player's carpentry increases to 8

Nutritionist is added when the player's cooking increases to 8

Ametuar Electrician is added when the player's electric increases to 4

Herbalist is added when the player's foraging increases to 4

CATEGORY SPECIFIC TRAITS:-------------------------------------------------------------------------------------------------
The way this works, is the player is assigned a pseudo 'stat' for each category of skills.

the general 'Agility' / dexterity skill is the total value of all the player's skills under the agility category, the category contains 4 skills and therefor had a maximum of 40

the general 'Crafting' / intelligence skill is the total value of all the player's skills under the crafting category, the category contains 8 skills and therefor had a maximum of 80

the general 'Combat' skill is the total value of all the player's skills under both the 'combat' and 'firearm' categories, these categories combined contain 9 skills, and therefor have a maximum of 90

the general 'Survivalist' skill is the total value of all the player's skills under the survivalist category, the category contains 3 skills and therefor had a maximum of 30

The traits are as follows:

at 5 total agility stats, sunday driver is removed

at 10 total agility stats, burglar is added

at 15 total agility stats, speed demon AND adrenaline junkie are added

at 20 total agility stats, night owl is added

-

at 10 total combat stats, short sighted is removed

at 15 total combat stats, hard of hearing is removed

at 20 total combat stats, eagle eyed is added

at 25 total combat stats, keen hearing is added

-

at 10 total crafting stats, illiterate is removed (slow reader is added)

at 15 total crafting stats, slow reader is removed

at 20 total crafting stats, slow learner is removed

at 25 total crafting stats, disorganized is removed

at 30 total crafting stats, fast reader is added

at 35 total crafting stats, fast learner is added

at 40 total crafting stats, organized is added

-

at 5 total survivalist stats, pulviophobia is removed

at 10 total survivalist stats, cats eyes is added

at 15 total survivalist stats, ourdoorsman AND pulviophilia is added

-

each player also had a psuedo 'luk' stat, which is the total of every single skill they have besides passive (strength and fitness) skills. There are 24 skills accounted for this way, therefor this 'stat' has a maximum of 240

at 60 total 'luk', unlucky is removed

at 120 total 'luk', lucky is added

-

REASONING:
Agility is self explanatory, though i did also include some of the traits related to the scoundrel aesthetic for the reason they didn't really fit anywhere else (burglar and night owl)

The main use of our perceptive abilities in project zomboid is to locate danger, therefor it would make the most sense to have our perceptive abilities increased by increasing our combat skills.

Crafting skills could be seen as a general indicator of our characters intelligence, or book smarts more specifically. Therefor it makes sense that learning these various skills would increase our mental 'acuity' and allow us to do things like learn to read if we cannot, learn things faster, and be more organized

Survivalist is self explanatory.

The maximum benefit is gained from each category by attaining half of all possible skill points in that category, except for combat as it is both the largest category and also the most impractical to branch to multiple skills on with a normal character.

THE HEALTH SYSTEM
This one is a bit more simple. Every positive and negative trait from this section has been removed from character creation, except for stomach upgrades which are permanent should you do that. Buffs can only be attained by being in the middle between underweight and overweight. Something also odd was that in the original mod, being overweight caused you to lose hunger and thirst *faster*, which realistically doesn't really make any sense (unless you have some preconceptions about what fat people are like, oopsie!). During a zombie apocalypse, losing weight is a bit more of a concern than gaining it, but I'll just get to the traits already.

If you are emaciated OR very underweight you will have these traits:------

Prone to Illness
Thin Skinned
Sedentary
Asthmatic
Slow Healer
Hearty Appetite
High Thirst

If you are underweight you will have these traits:----

Hearty Appetite
High Thirst
Thin Skinned

If you are obese you will have these traits:----

Asthmatic
Sedentary

(if you are overweight, you will have no debuffs, but you cannot gain buffs from this system either.)

If you are in the middle, you will have no debuffs, yay! You also gain access to some buffs depending on how high your fitness and strength skills are, but be careful, if you go back to underweight or overweight you will lose access to the buffs untill you return to 75-85 weight. The buffs are as follows:

At 6 strength and 6 fitness you gain:----
Light Eater
Low Thirst
Wakeful
Active
If you have weak stomach, it is removed (permanent)

at 7 strength and 7 fitness you gain:----
Fast Healer
Resilient
Iron Gut (permanent)

at 8 strength and 8 fitness you gain:----
Thick Skinned

REASONING: Within the game, losing weight is much harder than gaining it, so this attempts to balance that out somewhat and make starvation a bit more of a threat, requiring more food and water while you remain underweight.

THE KILLS SYSTEM
Fairly simple system, you gain or lose traits the more zombies you kill. Like the other systems if you do not have the trait that is attempting to be removed, nothing happens. If you already have a trait that's trying to be added, nothing happens.

250 KILLS:
cowardly is removed
nightmares is removed

500 KILLS:
brave is added

750 KILLS:
agoraphobic is removed
claustrophobic is removed
hemophobic is removed

1000 KILLS:
brave is removed
desensitized is added
pacifist is removed


THE MOOD SYSTEM
Thank god, almost to the end, these last two systems are pretty simple.

Simply put, if your unhappiness reaches an intensity of 2, you lose wakeful temporarily if you have it, and gain sleepyhead until your unhappiness goes back down.

If your unhappiness OR your hunger reach an intensity of 3, you also temporarily gain the insomniac trait.

That's it. :D

THE ADDICTION SYSTEM
This system handles smoking and alcohol addiction, I actually didn't change these very much from the original mod as they seemed like good additions for handling addictions. PepperCat wrote this code, so I'm relaying my understanding of it from poking around in the files as best I can.

When a player is created they are given three variables, all set to zero:

'days since last smoke'
'days since last drink'
'alcoholism threshold' (at)

(you can become an alcoholic, but you cannot become addicted to smoking for some reason)

Now despite the name of the variables, there is a whole lot of ♥♥♥♥♥♥♥ that happens behind the scenes that would take a while to write out here, so I'm just going to give a basic gist:

Don't smoke for a month (30 days) (720 hours) and you will lose the smoker trait.

Don't drink for around 2/3 of a month (21 days) (504 hours) and you will lost the alcoholic trait

Becoming an alcoholic is largely dependent on chance;

for every hour you are above 0 drunkness, your 'at' score is increased by 72, with a 1/25 chance to increase it by an additional 12

for every hour you are at 0 drunkness, your 'at' score decreases by 1 with a 1/25 chance to decrease it by an additional 7

If your total 'at' score hits 750, congrats! You are an alcoholic!

That's it for gaining and losing traits! Congrats! Thank you for reading all this! There's more though! Sorry!

OTHER MECHANICS

For some reason the original mod has a hidden mechanic that I only found out about by digging around in the code. When overburdened (like REALLY overburdened) you have a chance to gain a fracture. The chance is 1/2700 every ten minutes. No idea why there isn't any documentation for this, but I don't see a reason to remove it.

The original crafting system is still here as well, meaning all recipes obtained only from skill books can now be learned naturally by leveling up each skill, yay!