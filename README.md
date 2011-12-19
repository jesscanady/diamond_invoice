# DiamondInvoice

Does some trivial parsing of the email invoice format used by [Diamond Comic
Distributors](http://www.diamondcomics.com/). 

## Features

### List incoming books

Provides an array of titles, lowercased. 

```ruby
@invoice = DiamondInvoice.new(File.read('path_to_invoice.txt'))
@invoice.new_titles
# => ["amazing spider-man #62", "animal man #2", ... ]
```

Got some books you don't want to see in the list? We can ignore them.

```ruby
# Ignore any title that contains "addult supplement."
# Case insensitive, matches if the keyword apepars anywhere in the title.
@invoice.excluded_titles << "adult supplement" 
@invoice.new_titles 
```
