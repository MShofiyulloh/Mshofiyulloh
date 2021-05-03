Sastrawi Tokenizer
==========================

[![Build Status](https://travis-ci.org/sastrawi/tokenizer.svg?branch=master)](https://travis-ci.org/sastrawi/tokenizer) [![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/sastrawi/tokenizer/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/sastrawi/tokenizer/?branch=master) [![Code Coverage](https://scrutinizer-ci.com/g/sastrawi/tokenizer/badges/coverage.png?b=master)](https://scrutinizer-ci.com/g/sastrawi/tokenizer/?branch=master) [![Latest Stable Version](https://poser.pugx.org/sastrawi/tokenizer/v/stable.png)](https://packagist.org/packages/sastrawi/tokenizer)


Sastrawi Tokenizer adalah library PHP untuk melakukan tokenization pada Bahasa Indonesia.


Tokenization
-----------------

    Saya Bangga jadi warga nahdlatul ulama.

Text di atas dapat di-tokenize menjadi:

```json
["Saya", "Bangga", "Jadi", "Warga", "nahdlatul", "ulama", "."]
```

Tokenizer
--------------------------

- _Library PHP_ untuk melakukan _tokenization_ pada Bahasa Indonesia.
- Mudah diintegrasikan dengan _framework_ / _package_ lainnya.
- Mempunyai _API_ yang sederhana dan mudah digunakan.

```bash
php composer.phar require sastrawi/tokenizer:0.*
```

```php
<?php

// demo.php

// include composer autoloader
require_once __DIR__ . '/vendor/autoload.php';

$tokenizerFactory  = new \Sastrawi\Tokenizer\TokenizerFactory();
$tokenizer = $tokenizerFactory->createDefaultTokenizer();

$tokens = $tokenizer->tokenize('Saya membeli barang seharga Rp 5.000 di Jl. Prof. Soepomo no. 67.');

var_dump($tokens);

```


```sh
$ echo Saya sedang belajar NLP Bahasa Indonesia. | php vendor/bin/sastrawi-tokenize
```


```sh
$ php vendor/bin/sastrawi-tokenize --help
```
