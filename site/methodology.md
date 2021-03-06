#Methodology

##Selection of Poems

For this project, our group elected to use a mixture of poems in the original Serbian as well as translated English versions.
While working solely in Serbian may have been preferable, the collective group's Serbian knowledge wasn't strong enough to gather
a fully Serbian corpus while maintaining any sort of parity of work. Therefore, we decided to do half-English, half-Serbian.

The English-language *Anthology of Jugoslav Poetry* edited by Dr. Beatrice L. Stevenson was the best available source for English.
It was both extensive, and old enough that it was outside copyright restrictions (as a plus, it was available in plain-text on
Project Gutenburg, eliminating necessary transcription work).

However, there are two major concerns in the work. Firstly, the translations may not be as faithful to the original as we would like.
For example, in poem VII of the anthology, the line "And my drink metheglin sweet" appears. Metheglin is a fairly specific adjective,
referring to mead, and while Serbia and the Balkan region does have an equivalent, "metheglin" itself is more common in British writing,
casting some doubt on the translations as a whole. We can't aim to rectify this situation ourselves by checking the questionable spots,
not only because Emma, our sole Serbian-speaker of any competence would be dramatically overworked, but because in any case, we don't have
the original Serbian versions of our English poems, drawing them from a second source. The second concern may not be a problem, but the
limited focus of the anthology on "women's songs" drove our research in that direction, which influences strongly our conclusions.

Our Serbian sources have a less complicated backstory. We draw them from Projekat Rastko, an online database of Serbian culture. The poems
on this site are generally much shorter than the ones in the *Anthology* and do not feature stanzas. In total, we have 15 Serbian-language
poems and 10 English-language poems.

##Markup

The markup for this project includes fairly few different element types, but quite a few attributes. We are not using many of these for the
current phase of the project, because once you get down into using more than two attributes simultaneously, our dataset becomes too thin to
make any real conclusions. In the future, once a larger quantity of poems are marked up, we can use them all to see how relationships, for
example, affect the distribution of adjectives.

The Serbian and English sources use different schemas due to different structure. For example, no schemas in the Serbian source, while the
English source doesn't have performance instructions. Serbian, unsurprisingly, doesn't have a translator whereas the English one obviously
does. However, the schemas were standardized down to the level of line and below, which is where all our relevant markup is located.

###Nouns
Our noun element was `noun`. In this instance, noun referred not only to proper and common nouns, but also, frequently, to pronouns as well.
- `gender`: In our project, we classified four gender: male, female, unknown, and plural. Male and female are fairly self-explanitory, but
also not necessary easy. In poem V in the English source, Harvest Song, for example, we had to puzzle out who was male and female based on
context cues and assumption about medieval Serbian farming practices. Unknown was used largely for animals (not uncommon in the English source)
and plural was used when there was a mixed group of both males and females.
- `relation`: Relation could be set as "fam" for family, "rom" for romantic, and "gen" for general, ie, anyone other than a family member or
romantic partner. We wanted to see how descriptions changed based on whether characters were romantic partners or family members. Sometimes,
this was harder to classify than one would think, given that a "bride", depending on the narrator could be a romantic partner, or a daughter-in-law,
a family member. Given that we have too few of any individual kind to draw conclusions, this is not currently used.
- `type`: Type was used to keep track of whether something was a name or not. Another researcher might think it was interesting what names popped
up most frequently in the text but we did not end up using this attribute. Interestingly, proper names seem much more common in the Serbian sources.
- `id`: the xsd:ID element let us give each noun a unique identifier so we could link it to one or more adjectives. This is not used in the
current phase of the project.

###Adjectives
Our adjective element was `adj`. It featured the following attributes.
- `posneg`: Posneg was either positive or negative. If something was neither positive nor negative, we did not mark it. This is unquestionably the
single most important attribute in the project (with gender, of course), because our research focuses on how the connotations of adjectives apply to
the characters of different genders, and is, along with gender, the attribute that we use in the current phase of our project.
- `gender`: Same as in nouns, which makes it slightly redundant. However, given the structure of xpath, it is much easier to find the adjectives of 
a certain connotation and gender if both are attributes within the same element so we thought it worth the trouble including it again.
- `ref`: xsd:IDREF allows us to match one or more adjectives to a single noun, so that Smilia of Poem IV can be a maiden that is not only sweet, but
also young and fair. 