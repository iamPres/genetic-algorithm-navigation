## Objects use a Genetic Algorithm to reach a target with Processing

### Overview
I have made two types of Genetic Algorithms for this project, Directional Navigation and Positional Navigation. Both have the same purpose. Reach the Target. The target is specified as a reddish ellipse in the lower right hand corner of the canvas. If you can't see it, you may want to maximize the sketch. It won't hurt it. In the upper left corner, I have placed a population of white ellipses. The black ellipse indicates the fittest object.There are two functions in every genetic algorithm, "mate()" and "mutate()." In this sketch they are conjoined to form "refine()." Throughout the generations, the genes from the fittest object are copied to the rest. This isn't the conventional mating style, but it works really well. However, if copying each others genes was all the population did, they would reach a local optimum instantly. To solve this problem, I have implemented  mutation. This adds some randomness to the genes so that the population can continue advancing. There are some additional functions for calculations.

### Directional Navigation
Using Directional Navigation, the population radiates from one fixed starting position every generation, and their goal is to get to the target. Since the populations speed decreases over time, they have to evolve to be facing in the target's direction and to be fast enough to reach the target before their speed reaches zero and a new generation begins. 

### Positional Navigation
Using Positional Navigation, the population is not fixed to any one position. From the starting coordinates, the population uses evolution to navigate to the target without a decreasing speed. Although, it takes many more generations, this proves to be a much quicker method of reaching the target because the population is not being reset constantly.
