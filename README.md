# qbs-sgdebug

[![Made by Ukrainian](https://img.shields.io/static/v1?label=Made%20by&message=Ukrainian&labelColor=1f5fb2&color=fad247&style=for-the-badge)](https://github.com/GooRoo/ukrainian-shields)

This Qbs module allows you to debug your Qt Quick Scene Graph's default renderer with ease. It doesn't do any kind of magic—just sets some of the environment variables before you run your app with `qbs run`. I was too tired of doing this manually in my terminal over and over again.

For more information on the theory and techniques, please, refer to the [Qt Quick Scene Graph Default Renderer](https://doc.qt.io/qt-5/qtquick-visualcanvas-scenegraph-renderer.html).

## Installation

### Get the module

```sh
$ mkdir 3rdParty
$ cd 3rdParty
$ git clone https://github.com/GooRoo/qbs-sgdebug.git
```

### Add path to your root project

```qml
Project {
    qbsSearchPaths: '3rdParty/qbs-sgdebug'
}
```

## Usage

Just add it as a dependency to your product and set the desired parameters:
```qml
CppApplication {
	Depends { name: 'scenegraphdebug' }

	scenegraphdebug.visualize: 'overdraw'
}
```

## Available properties

- **`logInfo`**. Possible values: `true`|`false`

  More information on _QRhi_ is [here](https://doc.qt.io/qt-5/qtquick-visualcanvas-scenegraph-renderer.html#rendering-via-the-qt-rendering-hardware-interface). Sets `QSG_RENDERER_DEBUG`.

- **`logStats`**. Possible values: `true`|`false`

  More information on _performance_ is [here](https://doc.qt.io/qt-5/qtquick-visualcanvas-scenegraph-renderer.html#performance). Sets `QSG_RENDERER_DEBUG`.

- **`logTiming`**. Possible values:  `true`|`false`

  More information on _performance_ is [here](https://doc.qt.io/qt-5/qtquick-visualcanvas-scenegraph-renderer.html#performance). Sets `QSG_RENDER_TIMING`.

- **`colorizeAtlasTextures`**. Possible values: `true`|`false`

  More information on _performance_ is [here](https://doc.qt.io/qt-5/qtquick-visualcanvas-scenegraph-renderer.html#performance). Sets `QSG_ATLAS_OVERLAY`.

- **`visualize`**. Possible values: `'batches'`|`'clip'`|`'changes'`|`'overdraw'`

  More information on _visualization_ is [here](https://doc.qt.io/qt-5/qtquick-visualcanvas-scenegraph-renderer.html#visualizing). Sets `QSG_VISUALIZE`.

# License

The module is distributed under the terms of [MIT license](LICENSE).
