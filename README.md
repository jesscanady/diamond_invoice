# DiamondInvoice

Does some trivial parsing of the email invoice format used by [Diamond Comic
Distributors](http://www.diamondcomics.com/). 

## Dedication

Adapted from some really old PHP code I wrote really early in my career for
[Comic Town](http://comictown.net) in Columbus, OH. If you're ever in Columbus
and need comics, give them a visit. 

## Installation

    gem install diamond_invoice

## Usage

First, create a new DiamondInvoice and give it your emailed invoice, as a
string.

```ruby
@invoice = DiamondInvoice.new(File.read('path_to_invoice.txt'))
```

Fetch a list of incoming items as an all-lowercase array.

```ruby
@invoice.new_titles

# => ["amazing spider-man #62", "animal man #2", ... ]
```

Got some books you don't want to see in the list? Ignore them like so:

```ruby
# Ignore any title that contains "adult supplement."
# Case insensitive, matches if the keyword apepars anywhere in the title.
@invoice.excluded_titles << "adult supplement" 
```

## Feature Request

At the moment, it won't do anything magical: no expanding abbreviations or cleaning up shoddy
titles, nor will it pull anything else out of the invoice line.

Have a suggestion for a feature? [Add it to the 
list](https://github.com/joncanady/diamond_invoice/issues/new)

## Testing

    $ rake 

Requires rspec ~> 2.7

## Contributing

1. Fork it
2. Create a branch (`git checkout -b my_feature_or_bugfix`)
3. Commit your changes (`git commit -am "Description of my change."`)
4. Push to your branch (`git push origin my_feature_or_bugfix`)
5. Send a [pull request](http://help.github.com/send-pull-requests/)

## License

See the `LICENSE` file.
