[![Build Status](https://github.com/taka-oda311/fmptools/actions/workflows/build.yml/badge.svg)](https://github.com/taka-oda311/fmptools/actions/workflows/build.yml)

FMP Tools
--

Some tools for reading FileMaker Pro files (fp3, fp5, fp7, and fmp12). See the
included [HACKING](./HACKING) file for technical information on the FileMaker
format.

Building from the git source first requires [autoconf](https://www.gnu.org/software/autoconf/):

```
autoreconf -i -f
```

Building from a release requires the usual:

```
./configure
make
make install
```

The tools installed to `$PREFIX/bin` include:

* `fmp2excel` - Convert a FileMaker Pro database to Excel (requires [libxlsxwriter](http://libxlsxwriter.github.io))
* `fmp2json` - Convert a FileMaker Pro database to JSON (requires [yajl](https://lloyd.github.io/yajl/))
* `fmp2sqlite` - Convert a FileMaker Pro database to SQLite (requires [sqlite](https://www.sqlite.org/index.html))

There is also a C library installed that is used by the above tools, but the
API is subject to change.

You might also enjoy [fp5dump](https://github.com/qwesda/fp5dump), although
that project does not read the newer fp7 and fmp12 formats.


Windows cross-compilation
--

The tools can be cross-compiled for 64-bit Windows from Linux using MinGW-w64.

Required components include:

* `x86_64-w64-mingw32-gcc`
* Windows-targeted SQLite
* Windows-targeted iconv

Example configure command:

```sh
CPPFLAGS="-I/path/to/windows/include" \
LDFLAGS="-L/path/to/windows/lib" \
LIBS="-liconv" \
./configure \
  --host=x86_64-w64-mingw32 \
  --disable-shared \
  --enable-static
```

Then build with:

```sh
make
```

This produces Windows executables such as:

```text
fmp2sqlite.exe
fmpdump.exe
```

If iconv is linked dynamically, place `iconv.dll` next to the executable when distributing it.

This fork also includes fixes for:

* opening FileMaker files in binary mode on Windows
* MinGW/iconv compatibility
* nested FMP12 column metadata
* SQLite parameter binding for sparse FileMaker column indexes
