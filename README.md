# Plintorio - Advanced Electricity Poles

A mod for the game Factorio that adds several customaizations to electricity poles.

## Features

- Settings to change the coverage area and wire reach of electric poles and substations.
  - The default is the same as in vanilla Factorio.
- Easily light up your base by attaching lamps to electricity poles before placing them.
  - Crafting costs: 1 pole and 1 lamp.
  - Recipes unlock with the same technologies as their regular pole equivalent, except for the small ones. Those become available with the Lamps technology.
- Automatically create red and/or green wires between electricity poles when placing them.
  - This can be toggled through the shortcut bar.

## Inspiration

- [Better Poles](https://mods.factorio.com/mod/Better_Poles) by [Phirane](https://mods.factorio.com/user/Phirane)
- [Pole Lamps](https://mods.factorio.com/mod/PoleLamps) by [Viidi](https://mods.factorio.com/user/Viidi)

## About Plintorio

All my mods are primarily developed for my own specific use cases and I don't plan on making major additions I wouldn't use myself. But I'm open to small changes for others, and your suggestions may inspire me to use my own mods differently too, so bigger changes aren't out of the question. (And Factorio is pretty flexible, so some updates might be easier than you'd think.) All feedback is welcome and will be taken into consideration.

Some features may feel like cheating, but I learned an important lesson a while ago: there is no right or wrong way to play games. Adjusting the single player mode doesn't affect anyone else in Factorio and as you bought it, you have the right to enjoy it the way *you* want. You don't have to stick to how the creators intended it or how others prefer it.

## Backstory & Design Choices

I loved how easy it was to place electric poles in vanilla Factorio by dragging a whole line. But inserters often fell in the gaps where no power is supplied, so I had to place a lot of poles one by one. It felt strange to be forced to put in the extra work when an easier method is available. The solution: fill in the gaps of the coverage area using Better Poles.

The next "problem" was that a wire length of medium poles doesn't match up nicely with other ranges like those of robopots and radars. I planned to work with multiples of 10 and thus needed medium poles to be placed one tile further apart. I then figured other distances for all poles could come in handy for other layouts.

A good way to light up your base is to place a lamp next to every electricity pole, but that still had to be done individually until I discovered Pole Lamps. That replaces the vanilla poles and makes the lamps free though, and even reduces their electricity costs by 80%. That felt like an unnecessary cheat, so I kept the regular poles and added separate recipes for poles with lamps.

Finally, even if you use radars for really long distance transmission of logistics signals, you may still need to carry them across several electric poles. I wasn't going to draw those one section at a time when everything else works automatically. Of course you may not want red and/or green wires everywhere, so I added a toggle for each.