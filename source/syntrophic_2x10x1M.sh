# Sample 10 replicates of 1 million steps in parallel at feasible delta G
for i in {1..10}; do
  echo "./sampling.py --reactions data/syntrophic.model.tab \
  --std_drG data/syntrophic.model_drGs.tab \
  --ratios data/syntrophic.ratio_range.tab \
  --outfile results/syntrophic_2x10x1M/syntrophic.sampling.${i}.tab \
  --constraints data/syntrophic.concentrations.tab \
  --concs results/syntrophic_mdf.csv --steps 1000000 --max_conc 1.5 \
  --conc_sums data/syntrophic.conc_sums.tab -n 100"
done | parallel --no-notice --jobs 10

# Sample 10 replicates of 1 million steps in parallel at optimum delta G
for i in {1..10}; do
  echo "./sampling.py --reactions data/syntrophic.model.tab \
  --std_drG data/syntrophic.model_drGs.tab \
  --ratios data/syntrophic.ratio_range.tab \
  --outfile results/syntrophic_2x10x1M/syntrophic.mdf_sampling.${i}.tab \
  --constraints data/syntrophic.concentrations.tab \
  --concs results/syntrophic_mdf.csv --steps 1000000 --max_conc 1.5 \
  --mdf 0.447935 --conc_sums data/syntrophic.conc_sums.tab -n 100"
done | parallel --no-notice --jobs 10
