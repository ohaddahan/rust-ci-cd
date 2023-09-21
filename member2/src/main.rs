use regex::Regex;

pub fn sample_regex<'a>() -> Vec<(&'a str, &'a str, &'a str)> {
    let re = Regex::new(r"(\d{4})-(\d{2})-(\d{2})").unwrap();
    let hay = "On 2010-03-14, foo happened. On 2014-10-14, bar happened.";

    let mut dates = vec![];
    for (_, [year, month, day]) in re.captures_iter(hay).map(|c| c.extract()) {
        dates.push((year, month, day));
    }
    dates
}

fn main() {
    println!("Hello, world! {:?}", sample_regex());
}
