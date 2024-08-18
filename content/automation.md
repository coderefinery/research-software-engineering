# Automation and reproducible workflows

:::{objectives}
- Understand the difference between a **script** and a **workflow**.
- Understand the pros and cons of "simple" scripts.
:::


## What if we need to run many similar calculations?

It all started relatively simple:
```bash
python generate-data.py --num-planets 100 --output-file initial.csv

python simulate.py --num-steps 50 \
                   --input-file initial.csv \
                   --output-file final.csv \
                   --trajectories-file trajectories.npz

python animate.py --initial-file initial.csv \
                  --trajectories-file trajectories.npz \
                  --output-file animation.mp4
```

But now we want to run this for **different numbers of planets**:
10, 20, 30, 40, ...

One possible solution:
```{code-block} bash
---
emphasize-lines: 3,4,14,15
---
#!/usr/bin/env bash

for num_planets in 10 20 30 40 50; do
    python generate-data.py --num-planets ${num_planets} \
                            --output-file initial.csv

    python simulate.py --num-steps 50 \
                       --input-file initial.csv \
                       --output-file final.csv \
                       --trajectories-file trajectories.npz

    python animate.py --initial-file initial.csv \
                      --trajectories-file trajectories.npz \
                      --output-file animation-${num_planets}.mp4
done
```


## Discussion

:::{discussion} How would you solve this problem?
Can you list some alternatives to the solution presented above
(for-loop inside a shell script)?
:::

::::{discussion} What are the pros and cons of the solution presented above?
- Consider the case where a step can take hours.
- Imagine needing to run hundreds of calculations.
- Consider the case where a step/calculation can fail.
- Consider the case where you might
  find a mistake in one of the Python scripts.

:::{solution}
What is good about the shell script solution:
- It documents what steps are taken.
- Relatively simple.
- Good solution if you only need to run this once or if it takes no time.
- What if separate steps need different resources (e.g., memory, CPU)
  or environments (e.g., different Python versions)?

Problems:
- Independent calculations are run one after the other.
- If some of them fail, you need to re-run everything or start commenting out
  lines.
- If you find a mistake in one of the scripts, we again need to re-run
  everything or start commenting out lines.

In this situation we need a **workflow**.
:::
::::


## Where to explore more

- [Snakemake](https://snakemake.github.io/)
- [Nextflow](https://www.nextflow.io/)
- There are many more tools and frameworks. **Do not invent your own!**
