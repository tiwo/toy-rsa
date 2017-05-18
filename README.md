
# Toy RSA encryption

note that RSA isn't very useful (or secure) without, for example, some message chunking / padding.


```python
from collections import namedtuple

BaseKey = namedtuple('Key', ('n', 'e', 'd'))

class Key(BaseKey):

    def __new__(cls, n, e, d=None):
        return super(Key, cls).__new__(cls, n, e, d)

    def encrypt(self, msg):
        return pow(msg, self.e, self.n)

    def decrypt(self, ciph):
        return pow(ciph, self.d, self.n)
    
    @property
    def public(self):
        return type(self)(self.n, self.e)
```


```python
privkey = Key(n=61*53, e=17, d=413)
pubkey = privkey.public
```


```python
pubkey.encrypt(1111)
```




    474




```python
privkey.decrypt(474)
```




    1111




```python
priv256b = Key(0xbf12d8819d36e5a6a1964a9dff3ace76eee4fb07558452f9ea6d7197eee9586f,
               65537,
               0x692a4f3defb0f26f674a9821240452f4118ccd95e488cbebc4ada40a088ec5f1)
pub256b = priv256b.public
```


```python
ciphertext = pub256b.encrypt(333444555)
ciphertext
```




    36589810154264848603703722010488456631515941390378346647631149855500723664563




```python
priv256b.decrypt(ciphertext)
```




    333444555




```python
import example_keys
```


```python
c = example_keys.huge_16384b.public.encrypt(112233445566778899)
```


```python
%time example_keys.huge_16384b.decrypt(c)
```

    Wall time: 12.7 s
    




    112233445566778899


