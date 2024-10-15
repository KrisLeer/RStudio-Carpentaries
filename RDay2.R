library(tidyverse)
gapminder_data <- read_csv("gapminder_data.csv")

summarize(gapminder_data, averageLifeExp=mean(lifeExp))
gapminder_data %>% summarize(averageLifeExp=mean(lifeExp))

#pipe operator %>% to pass the data value into the summarize function, if the line doesn't indent it is wrong

gapminder_data_summarized <- gapminder_data %>%
  summarize(averageLifeExp=mean(lifeExp))

#Find the mean population using the piping function.
gapminder_data %>%  
  summarize(recent_year = max(year))

#Let’s calculate the life expectancy for all countries for only that year. 
gapminder_data %>%
  filter(year == 2007) %>%
  summarize(average=mean(lifeExp))

gapminder_data %>%
  summarize(first_year=min(year))

#filter(race == EXACTLY HOW IT IS WRITTEN) slashes mean something in coding so have to put quotations
gapminder_data %>%
  filter(year == 1952) %>%
  summarize(average_gdp=mean(gdpPercap))

#summarize gives a single number and filter gives the rows that match that criteria
gapminder_data %>%
  group_by(year) %>%
  summarize(average=mean(lifeExp))

#calculating the average life expectancy by continent
gapminder_data %>%
  group_by(continent) %>%
  summarize(average=mean(lifeExp))

#add a new column that calculates the minimum life expectancy for each continent
gapminder_data %>%
  group_by(continent) %>%
  summarize(average=mean(lifeExp), min=min(lifeExp))

#get the total GDP, we could multiply the per capita GDP values by the total populatio
gapminder_data %>%
  mutate(gdp = pop * gdpPercap)

gapminder_data %>%
  mutate(gdp = pop/1000000 * gdpPercap)
#so the problem with the above is that you still need it to multiple but then make it a readjustment

gapminder_data %>%  
  mutate(gdp = pop * gdpPercap, popInMillions = pop / 1000000)  

gapminder_data %>%
  select(pop, year)

gapminder_data %>%
  select(country, continent, year, lifeExp)




