; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [330 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [654 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 69
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 68
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 109
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 250
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 284
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 49
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 81
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 146
	i32 66541672, ; 8: System.Diagnostics.StackTrace => 0x3f75868 => 31
	i32 67008169, ; 9: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 325
	i32 68219467, ; 10: System.Security.Cryptography.Primitives => 0x410f24b => 125
	i32 72070932, ; 11: Microsoft.Maui.Graphics.dll => 0x44bb714 => 207
	i32 82292897, ; 12: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 103
	i32 101534019, ; 13: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 268
	i32 117431740, ; 14: System.Runtime.InteropServices => 0x6ffddbc => 108
	i32 120558881, ; 15: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 268
	i32 122350210, ; 16: System.Threading.Channels.dll => 0x74aea82 => 140
	i32 134690465, ; 17: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 288
	i32 142721839, ; 18: System.Net.WebHeaderCollection => 0x881c32f => 78
	i32 149972175, ; 19: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 125
	i32 159306688, ; 20: System.ComponentModel.Annotations => 0x97ed3c0 => 14
	i32 165246403, ; 21: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 224
	i32 176265551, ; 22: System.ServiceProcess => 0xa81994f => 133
	i32 182336117, ; 23: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 270
	i32 184328833, ; 24: System.ValueTuple.dll => 0xafca281 => 152
	i32 195452805, ; 25: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 322
	i32 199333315, ; 26: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 323
	i32 205061960, ; 27: System.ComponentModel => 0xc38ff48 => 19
	i32 209399409, ; 28: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 222
	i32 220171995, ; 29: System.Diagnostics.Debug => 0xd1f8edb => 27
	i32 230216969, ; 30: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 244
	i32 230752869, ; 31: Microsoft.CSharp.dll => 0xdc10265 => 2
	i32 231409092, ; 32: System.Linq.Parallel => 0xdcb05c4 => 60
	i32 231814094, ; 33: System.Globalization => 0xdd133ce => 43
	i32 246610117, ; 34: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 92
	i32 254259026, ; 35: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 176
	i32 261689757, ; 36: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 227
	i32 276479776, ; 37: System.Threading.Timer.dll => 0x107abf20 => 148
	i32 278686392, ; 38: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 246
	i32 280482487, ; 39: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 243
	i32 280992041, ; 40: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 294
	i32 291076382, ; 41: System.IO.Pipes.AccessControl.dll => 0x1159791e => 55
	i32 298918909, ; 42: System.Net.Ping.dll => 0x11d123fd => 70
	i32 317674968, ; 43: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 322
	i32 318968648, ; 44: Xamarin.AndroidX.Activity.dll => 0x13031348 => 213
	i32 321597661, ; 45: System.Numerics => 0x132b30dd => 84
	i32 336156722, ; 46: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 307
	i32 342366114, ; 47: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 245
	i32 356389973, ; 48: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 306
	i32 360082299, ; 49: System.ServiceModel.Web => 0x15766b7b => 132
	i32 367780167, ; 50: System.IO.Pipes => 0x15ebe147 => 56
	i32 374914964, ; 51: System.Transactions.Local => 0x1658bf94 => 150
	i32 374940069, ; 52: nl\FlintecChatBotApp.resources => 0x165921a5 => 0
	i32 375677976, ; 53: System.Net.ServicePoint.dll => 0x16646418 => 75
	i32 379916513, ; 54: System.Threading.Thread.dll => 0x16a510e1 => 146
	i32 385762202, ; 55: System.Memory.dll => 0x16fe439a => 63
	i32 392610295, ; 56: System.Threading.ThreadPool.dll => 0x1766c1f7 => 147
	i32 395744057, ; 57: _Microsoft.Android.Resource.Designer => 0x17969339 => 326
	i32 403441872, ; 58: WindowsBase => 0x180c08d0 => 166
	i32 435591531, ; 59: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 318
	i32 441335492, ; 60: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 228
	i32 442565967, ; 61: System.Collections => 0x1a61054f => 13
	i32 450948140, ; 62: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 241
	i32 451504562, ; 63: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 126
	i32 456227837, ; 64: System.Web.HttpUtility.dll => 0x1b317bfd => 153
	i32 459347974, ; 65: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 114
	i32 465846621, ; 66: mscorlib => 0x1bc4415d => 167
	i32 469710990, ; 67: System.dll => 0x1bff388e => 165
	i32 476646585, ; 68: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 243
	i32 486930444, ; 69: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 256
	i32 498788369, ; 70: System.ObjectModel => 0x1dbae811 => 85
	i32 500358224, ; 71: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 305
	i32 503918385, ; 72: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 299
	i32 513247710, ; 73: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 200
	i32 526420162, ; 74: System.Transactions.dll => 0x1f6088c2 => 151
	i32 527452488, ; 75: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 288
	i32 530272170, ; 76: System.Linq.Queryable => 0x1f9b4faa => 61
	i32 539058512, ; 77: Microsoft.Extensions.Logging => 0x20216150 => 196
	i32 540030774, ; 78: System.IO.FileSystem.dll => 0x20303736 => 52
	i32 545304856, ; 79: System.Runtime.Extensions => 0x2080b118 => 104
	i32 546455878, ; 80: System.Runtime.Serialization.Xml => 0x20924146 => 115
	i32 549171840, ; 81: System.Globalization.Calendars => 0x20bbb280 => 41
	i32 557405415, ; 82: Jsr305Binding => 0x213954e7 => 281
	i32 569601784, ; 83: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 279
	i32 571435654, ; 84: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 191
	i32 577335427, ; 85: System.Security.Cryptography.Cng => 0x22697083 => 121
	i32 592146354, ; 86: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 313
	i32 601371474, ; 87: System.IO.IsolatedStorage.dll => 0x23d83352 => 53
	i32 605376203, ; 88: System.IO.Compression.FileSystem => 0x24154ecb => 45
	i32 613668793, ; 89: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 120
	i32 627609679, ; 90: Xamarin.AndroidX.CustomView => 0x2568904f => 233
	i32 627931235, ; 91: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 311
	i32 639843206, ; 92: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 239
	i32 643868501, ; 93: System.Net => 0x2660a755 => 82
	i32 654062132, ; 94: nl/FlintecChatBotApp.resources.dll => 0x26fc3234 => 0
	i32 662205335, ; 95: System.Text.Encodings.Web.dll => 0x27787397 => 137
	i32 663517072, ; 96: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 275
	i32 666292255, ; 97: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 220
	i32 672442732, ; 98: System.Collections.Concurrent => 0x2814a96c => 9
	i32 683518922, ; 99: System.Net.Security => 0x28bdabca => 74
	i32 688181140, ; 100: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 293
	i32 690569205, ; 101: System.Xml.Linq.dll => 0x29293ff5 => 156
	i32 691348768, ; 102: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 290
	i32 693804605, ; 103: System.Windows => 0x295a9e3d => 155
	i32 699345723, ; 104: System.Reflection.Emit => 0x29af2b3b => 93
	i32 700284507, ; 105: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 285
	i32 700358131, ; 106: System.IO.Compression.ZipFile => 0x29be9df3 => 46
	i32 706645707, ; 107: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 308
	i32 709557578, ; 108: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 296
	i32 720511267, ; 109: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 289
	i32 722857257, ; 110: System.Runtime.Loader.dll => 0x2b15ed29 => 110
	i32 735137430, ; 111: System.Security.SecureString.dll => 0x2bd14e96 => 130
	i32 752232764, ; 112: System.Diagnostics.Contracts.dll => 0x2cd6293c => 26
	i32 755313932, ; 113: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 210
	i32 759454413, ; 114: System.Net.Requests => 0x2d445acd => 73
	i32 762598435, ; 115: System.IO.Pipes.dll => 0x2d745423 => 56
	i32 775507847, ; 116: System.IO.Compression => 0x2e394f87 => 47
	i32 777317022, ; 117: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 317
	i32 789151979, ; 118: Microsoft.Extensions.Options => 0x2f0980eb => 199
	i32 790371945, ; 119: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 234
	i32 804008546, ; 120: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 180
	i32 804715423, ; 121: System.Data.Common => 0x2ff6fb9f => 23
	i32 807930345, ; 122: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 248
	i32 823281589, ; 123: System.Private.Uri.dll => 0x311247b5 => 87
	i32 830298997, ; 124: System.IO.Compression.Brotli => 0x317d5b75 => 44
	i32 832635846, ; 125: System.Xml.XPath.dll => 0x31a103c6 => 161
	i32 834051424, ; 126: System.Net.Quic => 0x31b69d60 => 72
	i32 843511501, ; 127: Xamarin.AndroidX.Print => 0x3246f6cd => 261
	i32 873119928, ; 128: Microsoft.VisualBasic => 0x340ac0b8 => 4
	i32 877678880, ; 129: System.Globalization.dll => 0x34505120 => 43
	i32 878954865, ; 130: System.Net.Http.Json => 0x3463c971 => 64
	i32 903699491, ; 131: FlintecChatBotApp.dll => 0x35dd5c23 => 1
	i32 904024072, ; 132: System.ComponentModel.Primitives.dll => 0x35e25008 => 17
	i32 911108515, ; 133: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 54
	i32 926902833, ; 134: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 320
	i32 928116545, ; 135: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 284
	i32 952186615, ; 136: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 106
	i32 956575887, ; 137: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 289
	i32 966729478, ; 138: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 282
	i32 967690846, ; 139: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 245
	i32 975236339, ; 140: System.Diagnostics.Tracing => 0x3a20ecf3 => 35
	i32 975874589, ; 141: System.Xml.XDocument => 0x3a2aaa1d => 159
	i32 986514023, ; 142: System.Private.DataContractSerialization.dll => 0x3acd0267 => 86
	i32 987214855, ; 143: System.Diagnostics.Tools => 0x3ad7b407 => 33
	i32 992768348, ; 144: System.Collections.dll => 0x3b2c715c => 13
	i32 994442037, ; 145: System.IO.FileSystem => 0x3b45fb35 => 52
	i32 999186168, ; 146: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 193
	i32 1001831731, ; 147: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 57
	i32 1012816738, ; 148: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 265
	i32 1019214401, ; 149: System.Drawing => 0x3cbffa41 => 37
	i32 1028951442, ; 150: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 188
	i32 1029334545, ; 151: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 295
	i32 1031528504, ; 152: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 283
	i32 1035644815, ; 153: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 218
	i32 1036536393, ; 154: System.Drawing.Primitives.dll => 0x3dc84a49 => 36
	i32 1044663988, ; 155: System.Linq.Expressions.dll => 0x3e444eb4 => 59
	i32 1052210849, ; 156: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 252
	i32 1067306892, ; 157: GoogleGson => 0x3f9dcf8c => 174
	i32 1082857460, ; 158: System.ComponentModel.TypeConverter => 0x408b17f4 => 18
	i32 1084122840, ; 159: Xamarin.Kotlin.StdLib => 0x409e66d8 => 286
	i32 1098259244, ; 160: System => 0x41761b2c => 165
	i32 1106973742, ; 161: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 185
	i32 1118262833, ; 162: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 308
	i32 1121599056, ; 163: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 251
	i32 1127624469, ; 164: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 198
	i32 1149092582, ; 165: Xamarin.AndroidX.Window => 0x447dc2e6 => 278
	i32 1151688376, ; 166: FlintecChatBotApp => 0x44a55eb8 => 1
	i32 1168523401, ; 167: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 314
	i32 1170634674, ; 168: System.Web.dll => 0x45c677b2 => 154
	i32 1173126369, ; 169: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 189
	i32 1175144683, ; 170: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 274
	i32 1178241025, ; 171: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 259
	i32 1203215381, ; 172: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 312
	i32 1204270330, ; 173: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 220
	i32 1208641965, ; 174: System.Diagnostics.Process => 0x480a69ad => 30
	i32 1219128291, ; 175: System.IO.IsolatedStorage => 0x48aa6be3 => 53
	i32 1234928153, ; 176: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 310
	i32 1243150071, ; 177: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 279
	i32 1253011324, ; 178: Microsoft.Win32.Registry => 0x4aaf6f7c => 6
	i32 1260983243, ; 179: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 294
	i32 1264511973, ; 180: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 269
	i32 1267360935, ; 181: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 273
	i32 1273260888, ; 182: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 225
	i32 1275534314, ; 183: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 290
	i32 1278448581, ; 184: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 217
	i32 1293217323, ; 185: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 236
	i32 1309188875, ; 186: System.Private.DataContractSerialization => 0x4e08a30b => 86
	i32 1322716291, ; 187: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 278
	i32 1324164729, ; 188: System.Linq => 0x4eed2679 => 62
	i32 1335329327, ; 189: System.Runtime.Serialization.Json.dll => 0x4f97822f => 113
	i32 1364015309, ; 190: System.IO => 0x514d38cd => 58
	i32 1373134921, ; 191: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 324
	i32 1376866003, ; 192: Xamarin.AndroidX.SavedState => 0x52114ed3 => 265
	i32 1379779777, ; 193: System.Resources.ResourceManager => 0x523dc4c1 => 100
	i32 1402170036, ; 194: System.Configuration.dll => 0x53936ab4 => 20
	i32 1406073936, ; 195: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 229
	i32 1408764838, ; 196: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 112
	i32 1411638395, ; 197: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 102
	i32 1422545099, ; 198: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 103
	i32 1430672901, ; 199: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 292
	i32 1434145427, ; 200: System.Runtime.Handles => 0x557b5293 => 105
	i32 1435222561, ; 201: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 282
	i32 1439761251, ; 202: System.Net.Quic.dll => 0x55d10363 => 72
	i32 1452070440, ; 203: System.Formats.Asn1.dll => 0x568cd628 => 39
	i32 1453312822, ; 204: System.Diagnostics.Tools.dll => 0x569fcb36 => 33
	i32 1454105418, ; 205: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 190
	i32 1457743152, ; 206: System.Runtime.Extensions.dll => 0x56e36530 => 104
	i32 1458022317, ; 207: System.Net.Security.dll => 0x56e7a7ad => 74
	i32 1461004990, ; 208: es\Microsoft.Maui.Controls.resources => 0x57152abe => 298
	i32 1461234159, ; 209: System.Collections.Immutable.dll => 0x5718a9ef => 10
	i32 1461719063, ; 210: System.Security.Cryptography.OpenSsl => 0x57201017 => 124
	i32 1462112819, ; 211: System.IO.Compression.dll => 0x57261233 => 47
	i32 1469204771, ; 212: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 219
	i32 1470490898, ; 213: Microsoft.Extensions.Primitives => 0x57a5e912 => 200
	i32 1479771757, ; 214: System.Collections.Immutable => 0x5833866d => 10
	i32 1480492111, ; 215: System.IO.Compression.Brotli.dll => 0x583e844f => 44
	i32 1487239319, ; 216: Microsoft.Win32.Primitives => 0x58a57897 => 5
	i32 1490025113, ; 217: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 266
	i32 1493001747, ; 218: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 302
	i32 1514721132, ; 219: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 297
	i32 1521091094, ; 220: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 193
	i32 1536373174, ; 221: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 32
	i32 1543031311, ; 222: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 139
	i32 1543355203, ; 223: System.Reflection.Emit.dll => 0x5bfdbb43 => 93
	i32 1546581739, ; 224: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 180
	i32 1550322496, ; 225: System.Reflection.Extensions.dll => 0x5c680b40 => 94
	i32 1551623176, ; 226: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 317
	i32 1565862583, ; 227: System.IO.FileSystem.Primitives => 0x5d552ab7 => 50
	i32 1566207040, ; 228: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 142
	i32 1573704789, ; 229: System.Runtime.Serialization.Json => 0x5dccd455 => 113
	i32 1580037396, ; 230: System.Threading.Overlapped => 0x5e2d7514 => 141
	i32 1582372066, ; 231: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 235
	i32 1592978981, ; 232: System.Runtime.Serialization.dll => 0x5ef2ee25 => 116
	i32 1597949149, ; 233: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 283
	i32 1601112923, ; 234: System.Xml.Serialization => 0x5f6f0b5b => 158
	i32 1604827217, ; 235: System.Net.WebClient => 0x5fa7b851 => 77
	i32 1618516317, ; 236: System.Net.WebSockets.Client.dll => 0x6078995d => 80
	i32 1622152042, ; 237: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 255
	i32 1622358360, ; 238: System.Dynamic.Runtime => 0x60b33958 => 38
	i32 1624863272, ; 239: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 277
	i32 1632842087, ; 240: Microsoft.Extensions.Configuration.Json => 0x61533167 => 186
	i32 1635184631, ; 241: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 239
	i32 1636350590, ; 242: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 232
	i32 1639515021, ; 243: System.Net.Http.dll => 0x61b9038d => 65
	i32 1639986890, ; 244: System.Text.RegularExpressions => 0x61c036ca => 139
	i32 1641389582, ; 245: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 16
	i32 1654881142, ; 246: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 179
	i32 1657153582, ; 247: System.Runtime => 0x62c6282e => 117
	i32 1658241508, ; 248: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 271
	i32 1658251792, ; 249: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 280
	i32 1670060433, ; 250: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 227
	i32 1675553242, ; 251: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 49
	i32 1677501392, ; 252: System.Net.Primitives.dll => 0x63fca3d0 => 71
	i32 1678508291, ; 253: System.Net.WebSockets => 0x640c0103 => 81
	i32 1679769178, ; 254: System.Security.Cryptography => 0x641f3e5a => 127
	i32 1691477237, ; 255: System.Reflection.Metadata => 0x64d1e4f5 => 95
	i32 1696967625, ; 256: System.Security.Cryptography.Csp => 0x6525abc9 => 122
	i32 1698840827, ; 257: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 287
	i32 1701541528, ; 258: System.Diagnostics.Debug.dll => 0x656b7698 => 27
	i32 1720223769, ; 259: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 248
	i32 1726116996, ; 260: System.Reflection.dll => 0x66e27484 => 98
	i32 1728033016, ; 261: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 29
	i32 1729485958, ; 262: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 223
	i32 1736233607, ; 263: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 315
	i32 1743415430, ; 264: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 293
	i32 1744735666, ; 265: System.Transactions.Local.dll => 0x67fe8db2 => 150
	i32 1746115085, ; 266: System.IO.Pipelines.dll => 0x68139a0d => 208
	i32 1746316138, ; 267: Mono.Android.Export => 0x6816ab6a => 170
	i32 1750313021, ; 268: Microsoft.Win32.Primitives.dll => 0x6853a83d => 5
	i32 1758240030, ; 269: System.Resources.Reader.dll => 0x68cc9d1e => 99
	i32 1760259689, ; 270: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 178
	i32 1763938596, ; 271: System.Diagnostics.TraceSource.dll => 0x69239124 => 34
	i32 1765942094, ; 272: System.Reflection.Extensions => 0x6942234e => 94
	i32 1766324549, ; 273: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 270
	i32 1770582343, ; 274: Microsoft.Extensions.Logging.dll => 0x6988f147 => 196
	i32 1776026572, ; 275: System.Core.dll => 0x69dc03cc => 22
	i32 1777075843, ; 276: System.Globalization.Extensions.dll => 0x69ec0683 => 42
	i32 1780572499, ; 277: Mono.Android.Runtime.dll => 0x6a216153 => 171
	i32 1782862114, ; 278: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 309
	i32 1788241197, ; 279: Xamarin.AndroidX.Fragment => 0x6a96652d => 241
	i32 1793755602, ; 280: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 301
	i32 1808609942, ; 281: Xamarin.AndroidX.Loader => 0x6bcd3296 => 255
	i32 1813058853, ; 282: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 286
	i32 1813201214, ; 283: Xamarin.Google.Android.Material => 0x6c13413e => 280
	i32 1818569960, ; 284: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 260
	i32 1818787751, ; 285: Microsoft.VisualBasic.Core => 0x6c687fa7 => 3
	i32 1824175904, ; 286: System.Text.Encoding.Extensions => 0x6cbab720 => 135
	i32 1824722060, ; 287: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 112
	i32 1828688058, ; 288: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 197
	i32 1842015223, ; 289: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 321
	i32 1847515442, ; 290: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 210
	i32 1853025655, ; 291: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 318
	i32 1858542181, ; 292: System.Linq.Expressions => 0x6ec71a65 => 59
	i32 1870277092, ; 293: System.Reflection.Primitives => 0x6f7a29e4 => 96
	i32 1875935024, ; 294: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 300
	i32 1879696579, ; 295: System.Formats.Tar.dll => 0x7009e4c3 => 40
	i32 1885316902, ; 296: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 221
	i32 1888955245, ; 297: System.Diagnostics.Contracts => 0x70972b6d => 26
	i32 1889954781, ; 298: System.Reflection.Metadata.dll => 0x70a66bdd => 95
	i32 1898237753, ; 299: System.Reflection.DispatchProxy => 0x7124cf39 => 90
	i32 1900610850, ; 300: System.Resources.ResourceManager.dll => 0x71490522 => 100
	i32 1910275211, ; 301: System.Collections.NonGeneric.dll => 0x71dc7c8b => 11
	i32 1939592360, ; 302: System.Private.Xml.Linq => 0x739bd4a8 => 88
	i32 1956758971, ; 303: System.Resources.Writer => 0x74a1c5bb => 101
	i32 1961813231, ; 304: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 267
	i32 1968388702, ; 305: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 182
	i32 1983156543, ; 306: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 287
	i32 1985761444, ; 307: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 212
	i32 2003115576, ; 308: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 297
	i32 2011961780, ; 309: System.Buffers.dll => 0x77ec19b4 => 8
	i32 2019465201, ; 310: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 252
	i32 2025202353, ; 311: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 292
	i32 2031763787, ; 312: Xamarin.Android.Glide => 0x791a414b => 209
	i32 2045470958, ; 313: System.Private.Xml => 0x79eb68ee => 89
	i32 2048278909, ; 314: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 184
	i32 2055257422, ; 315: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 247
	i32 2060060697, ; 316: System.Windows.dll => 0x7aca0819 => 155
	i32 2066184531, ; 317: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 296
	i32 2070888862, ; 318: System.Diagnostics.TraceSource => 0x7b6f419e => 34
	i32 2072397586, ; 319: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 192
	i32 2079903147, ; 320: System.Runtime.dll => 0x7bf8cdab => 117
	i32 2090596640, ; 321: System.Numerics.Vectors => 0x7c9bf920 => 83
	i32 2127167465, ; 322: System.Console => 0x7ec9ffe9 => 21
	i32 2142473426, ; 323: System.Collections.Specialized => 0x7fb38cd2 => 12
	i32 2143790110, ; 324: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 163
	i32 2146852085, ; 325: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 4
	i32 2159891885, ; 326: Microsoft.Maui => 0x80bd55ad => 205
	i32 2169148018, ; 327: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 304
	i32 2181898931, ; 328: Microsoft.Extensions.Options.dll => 0x820d22b3 => 199
	i32 2192057212, ; 329: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 197
	i32 2193016926, ; 330: System.ObjectModel.dll => 0x82b6c85e => 85
	i32 2201107256, ; 331: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 291
	i32 2201231467, ; 332: System.Net.Http => 0x8334206b => 65
	i32 2207618523, ; 333: it\Microsoft.Maui.Controls.resources => 0x839595db => 306
	i32 2217644978, ; 334: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 274
	i32 2222056684, ; 335: System.Threading.Tasks.Parallel => 0x8471e4ec => 144
	i32 2244775296, ; 336: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 256
	i32 2252106437, ; 337: System.Xml.Serialization.dll => 0x863c6ac5 => 158
	i32 2256313426, ; 338: System.Globalization.Extensions => 0x867c9c52 => 42
	i32 2265110946, ; 339: System.Security.AccessControl.dll => 0x8702d9a2 => 118
	i32 2266799131, ; 340: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 183
	i32 2267999099, ; 341: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 211
	i32 2270573516, ; 342: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 300
	i32 2279755925, ; 343: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 263
	i32 2293034957, ; 344: System.ServiceModel.Web.dll => 0x88acefcd => 132
	i32 2295906218, ; 345: System.Net.Sockets => 0x88d8bfaa => 76
	i32 2298471582, ; 346: System.Net.Mail => 0x88ffe49e => 67
	i32 2303942373, ; 347: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 310
	i32 2305521784, ; 348: System.Private.CoreLib.dll => 0x896b7878 => 173
	i32 2315684594, ; 349: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 215
	i32 2320631194, ; 350: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 144
	i32 2340441535, ; 351: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 107
	i32 2344264397, ; 352: System.ValueTuple => 0x8bbaa2cd => 152
	i32 2353062107, ; 353: System.Net.Primitives => 0x8c40e0db => 71
	i32 2368005991, ; 354: System.Xml.ReaderWriter.dll => 0x8d24e767 => 157
	i32 2371007202, ; 355: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 182
	i32 2378619854, ; 356: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 122
	i32 2383496789, ; 357: System.Security.Principal.Windows.dll => 0x8e114655 => 128
	i32 2395872292, ; 358: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 305
	i32 2401565422, ; 359: System.Web.HttpUtility => 0x8f24faee => 153
	i32 2403452196, ; 360: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 238
	i32 2411328690, ; 361: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 176
	i32 2421380589, ; 362: System.Threading.Tasks.Dataflow => 0x905355ed => 142
	i32 2423080555, ; 363: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 225
	i32 2427813419, ; 364: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 302
	i32 2435356389, ; 365: System.Console.dll => 0x912896e5 => 21
	i32 2435904999, ; 366: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 15
	i32 2442556106, ; 367: Microsoft.JSInterop.dll => 0x919672ca => 201
	i32 2454642406, ; 368: System.Text.Encoding.dll => 0x924edee6 => 136
	i32 2458678730, ; 369: System.Net.Sockets.dll => 0x928c75ca => 76
	i32 2459001652, ; 370: System.Linq.Parallel.dll => 0x92916334 => 60
	i32 2465532216, ; 371: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 228
	i32 2471841756, ; 372: netstandard.dll => 0x93554fdc => 168
	i32 2475788418, ; 373: Java.Interop.dll => 0x93918882 => 169
	i32 2480646305, ; 374: Microsoft.Maui.Controls => 0x93dba8a1 => 203
	i32 2483903535, ; 375: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 16
	i32 2484371297, ; 376: System.Net.ServicePoint => 0x94147f61 => 75
	i32 2490993605, ; 377: System.AppContext.dll => 0x94798bc5 => 7
	i32 2501346920, ; 378: System.Data.DataSetExtensions => 0x95178668 => 24
	i32 2505896520, ; 379: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 250
	i32 2522472828, ; 380: Xamarin.Android.Glide.dll => 0x9659e17c => 209
	i32 2537015816, ; 381: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 175
	i32 2538310050, ; 382: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 92
	i32 2550873716, ; 383: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 303
	i32 2562349572, ; 384: Microsoft.CSharp => 0x98ba5a04 => 2
	i32 2570120770, ; 385: System.Text.Encodings.Web => 0x9930ee42 => 137
	i32 2581783588, ; 386: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 251
	i32 2581819634, ; 387: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 273
	i32 2585220780, ; 388: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 135
	i32 2585805581, ; 389: System.Net.Ping => 0x9a20430d => 70
	i32 2585813321, ; 390: Microsoft.AspNetCore.Components.Forms => 0x9a206149 => 177
	i32 2589602615, ; 391: System.Threading.ThreadPool => 0x9a5a3337 => 147
	i32 2592341985, ; 392: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 189
	i32 2593496499, ; 393: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 312
	i32 2605712449, ; 394: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 291
	i32 2615233544, ; 395: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 242
	i32 2616218305, ; 396: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 198
	i32 2617129537, ; 397: System.Private.Xml.dll => 0x9bfe3a41 => 89
	i32 2618712057, ; 398: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 97
	i32 2620871830, ; 399: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 232
	i32 2624644809, ; 400: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 237
	i32 2626831493, ; 401: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 307
	i32 2627185994, ; 402: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 32
	i32 2629843544, ; 403: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 46
	i32 2633051222, ; 404: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 246
	i32 2663391936, ; 405: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 211
	i32 2663698177, ; 406: System.Runtime.Loader => 0x9ec4cf01 => 110
	i32 2664396074, ; 407: System.Xml.XDocument.dll => 0x9ecf752a => 159
	i32 2665622720, ; 408: System.Drawing.Primitives => 0x9ee22cc0 => 36
	i32 2676780864, ; 409: System.Data.Common.dll => 0x9f8c6f40 => 23
	i32 2686887180, ; 410: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 115
	i32 2692077919, ; 411: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 179
	i32 2693849962, ; 412: System.IO.dll => 0xa090e36a => 58
	i32 2701096212, ; 413: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 271
	i32 2715334215, ; 414: System.Threading.Tasks.dll => 0xa1d8b647 => 145
	i32 2717744543, ; 415: System.Security.Claims => 0xa1fd7d9f => 119
	i32 2719963679, ; 416: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 121
	i32 2724373263, ; 417: System.Runtime.Numerics.dll => 0xa262a30f => 111
	i32 2732626843, ; 418: Xamarin.AndroidX.Activity => 0xa2e0939b => 213
	i32 2735172069, ; 419: System.Threading.Channels => 0xa30769e5 => 140
	i32 2735631878, ; 420: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 175
	i32 2737747696, ; 421: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 219
	i32 2740948882, ; 422: System.IO.Pipes.AccessControl => 0xa35f8f92 => 55
	i32 2748088231, ; 423: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 106
	i32 2752995522, ; 424: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 313
	i32 2758225723, ; 425: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 204
	i32 2764765095, ; 426: Microsoft.Maui.dll => 0xa4caf7a7 => 205
	i32 2765824710, ; 427: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 134
	i32 2770495804, ; 428: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 285
	i32 2778768386, ; 429: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 276
	i32 2779977773, ; 430: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 264
	i32 2785988530, ; 431: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 319
	i32 2788224221, ; 432: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 242
	i32 2801831435, ; 433: Microsoft.Maui.Graphics => 0xa7008e0b => 207
	i32 2803228030, ; 434: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 160
	i32 2806116107, ; 435: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 298
	i32 2810250172, ; 436: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 229
	i32 2819470561, ; 437: System.Xml.dll => 0xa80db4e1 => 164
	i32 2821205001, ; 438: System.ServiceProcess.dll => 0xa8282c09 => 133
	i32 2821294376, ; 439: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 264
	i32 2824502124, ; 440: System.Xml.XmlDocument => 0xa85a7b6c => 162
	i32 2831556043, ; 441: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 311
	i32 2833784645, ; 442: Microsoft.AspNetCore.Metadata => 0xa8e81f45 => 181
	i32 2838993487, ; 443: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 253
	i32 2849599387, ; 444: System.Threading.Overlapped.dll => 0xa9d96f9b => 141
	i32 2853208004, ; 445: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 276
	i32 2855708567, ; 446: Xamarin.AndroidX.Transition => 0xaa36a797 => 272
	i32 2861098320, ; 447: Mono.Android.Export.dll => 0xaa88e550 => 170
	i32 2861189240, ; 448: Microsoft.Maui.Essentials => 0xaa8a4878 => 206
	i32 2870099610, ; 449: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 214
	i32 2875164099, ; 450: Jsr305Binding.dll => 0xab5f85c3 => 281
	i32 2875220617, ; 451: System.Globalization.Calendars.dll => 0xab606289 => 41
	i32 2884993177, ; 452: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 240
	i32 2887636118, ; 453: System.Net.dll => 0xac1dd496 => 82
	i32 2892341533, ; 454: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 178
	i32 2899753641, ; 455: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 57
	i32 2900621748, ; 456: System.Dynamic.Runtime.dll => 0xace3f9b4 => 38
	i32 2901442782, ; 457: System.Reflection => 0xacf080de => 98
	i32 2905242038, ; 458: mscorlib.dll => 0xad2a79b6 => 167
	i32 2909740682, ; 459: System.Private.CoreLib => 0xad6f1e8a => 173
	i32 2911054922, ; 460: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 192
	i32 2916838712, ; 461: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 277
	i32 2919462931, ; 462: System.Numerics.Vectors.dll => 0xae037813 => 83
	i32 2921128767, ; 463: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 216
	i32 2936416060, ; 464: System.Resources.Reader => 0xaf06273c => 99
	i32 2940926066, ; 465: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 31
	i32 2942453041, ; 466: System.Xml.XPath.XDocument => 0xaf624531 => 160
	i32 2959614098, ; 467: System.ComponentModel.dll => 0xb0682092 => 19
	i32 2968338931, ; 468: System.Security.Principal.Windows => 0xb0ed41f3 => 128
	i32 2972252294, ; 469: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 120
	i32 2978675010, ; 470: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 236
	i32 2987532451, ; 471: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 267
	i32 2996846495, ; 472: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 249
	i32 3016983068, ; 473: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 269
	i32 3023353419, ; 474: WindowsBase.dll => 0xb434b64b => 166
	i32 3024354802, ; 475: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 244
	i32 3038032645, ; 476: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 326
	i32 3056245963, ; 477: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 266
	i32 3057625584, ; 478: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 257
	i32 3059408633, ; 479: Mono.Android.Runtime => 0xb65adef9 => 171
	i32 3059793426, ; 480: System.ComponentModel.Primitives => 0xb660be12 => 17
	i32 3075834255, ; 481: System.Threading.Tasks => 0xb755818f => 145
	i32 3077302341, ; 482: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 304
	i32 3090735792, ; 483: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 126
	i32 3099732863, ; 484: System.Security.Claims.dll => 0xb8c22b7f => 119
	i32 3103600923, ; 485: System.Formats.Asn1 => 0xb8fd311b => 39
	i32 3111772706, ; 486: System.Runtime.Serialization => 0xb979e222 => 116
	i32 3121463068, ; 487: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 48
	i32 3124832203, ; 488: System.Threading.Tasks.Extensions => 0xba4127cb => 143
	i32 3132293585, ; 489: System.Security.AccessControl => 0xbab301d1 => 118
	i32 3147165239, ; 490: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 35
	i32 3148237826, ; 491: GoogleGson.dll => 0xbba64c02 => 174
	i32 3159123045, ; 492: System.Reflection.Primitives.dll => 0xbc4c6465 => 96
	i32 3160747431, ; 493: System.IO.MemoryMappedFiles => 0xbc652da7 => 54
	i32 3178803400, ; 494: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 258
	i32 3192346100, ; 495: System.Security.SecureString => 0xbe4755f4 => 130
	i32 3193515020, ; 496: System.Web => 0xbe592c0c => 154
	i32 3204380047, ; 497: System.Data.dll => 0xbefef58f => 25
	i32 3209718065, ; 498: System.Xml.XmlDocument.dll => 0xbf506931 => 162
	i32 3211777861, ; 499: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 235
	i32 3220365878, ; 500: System.Threading => 0xbff2e236 => 149
	i32 3226221578, ; 501: System.Runtime.Handles.dll => 0xc04c3c0a => 105
	i32 3251039220, ; 502: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 90
	i32 3258312781, ; 503: Xamarin.AndroidX.CardView => 0xc235e84d => 223
	i32 3265493905, ; 504: System.Linq.Queryable.dll => 0xc2a37b91 => 61
	i32 3265893370, ; 505: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 143
	i32 3277815716, ; 506: System.Resources.Writer.dll => 0xc35f7fa4 => 101
	i32 3279906254, ; 507: Microsoft.Win32.Registry.dll => 0xc37f65ce => 6
	i32 3280506390, ; 508: System.ComponentModel.Annotations.dll => 0xc3888e16 => 14
	i32 3290767353, ; 509: System.Security.Cryptography.Encoding => 0xc4251ff9 => 123
	i32 3299363146, ; 510: System.Text.Encoding => 0xc4a8494a => 136
	i32 3303498502, ; 511: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 29
	i32 3305363605, ; 512: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 299
	i32 3316684772, ; 513: System.Net.Requests.dll => 0xc5b097e4 => 73
	i32 3317135071, ; 514: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 233
	i32 3317144872, ; 515: System.Data => 0xc5b79d28 => 25
	i32 3340431453, ; 516: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 221
	i32 3345895724, ; 517: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 262
	i32 3346324047, ; 518: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 259
	i32 3357674450, ; 519: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 316
	i32 3358260929, ; 520: System.Text.Json => 0xc82afec1 => 138
	i32 3362336904, ; 521: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 214
	i32 3362522851, ; 522: Xamarin.AndroidX.Core => 0xc86c06e3 => 230
	i32 3366347497, ; 523: Java.Interop => 0xc8a662e9 => 169
	i32 3374999561, ; 524: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 263
	i32 3381016424, ; 525: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 295
	i32 3395150330, ; 526: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 102
	i32 3403906625, ; 527: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 124
	i32 3405233483, ; 528: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 234
	i32 3406629867, ; 529: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 190
	i32 3421170118, ; 530: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 184
	i32 3428513518, ; 531: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 187
	i32 3429136800, ; 532: System.Xml => 0xcc6479a0 => 164
	i32 3430777524, ; 533: netstandard => 0xcc7d82b4 => 168
	i32 3441283291, ; 534: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 237
	i32 3445260447, ; 535: System.Formats.Tar => 0xcd5a809f => 40
	i32 3452344032, ; 536: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 202
	i32 3463511458, ; 537: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 303
	i32 3464190856, ; 538: Microsoft.AspNetCore.Components.Forms.dll => 0xce7b5b88 => 177
	i32 3471940407, ; 539: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 18
	i32 3476120550, ; 540: Mono.Android => 0xcf3163e6 => 172
	i32 3479583265, ; 541: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 316
	i32 3484440000, ; 542: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 315
	i32 3485117614, ; 543: System.Text.Json.dll => 0xcfbaacae => 138
	i32 3486566296, ; 544: System.Transactions => 0xcfd0c798 => 151
	i32 3493954962, ; 545: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 226
	i32 3500000672, ; 546: Microsoft.JSInterop => 0xd09dc5a0 => 201
	i32 3509114376, ; 547: System.Xml.Linq => 0xd128d608 => 156
	i32 3515174580, ; 548: System.Security.dll => 0xd1854eb4 => 131
	i32 3530912306, ; 549: System.Configuration => 0xd2757232 => 20
	i32 3539954161, ; 550: System.Net.HttpListener => 0xd2ff69f1 => 66
	i32 3560100363, ; 551: System.Threading.Timer => 0xd432d20b => 148
	i32 3570554715, ; 552: System.IO.FileSystem.AccessControl => 0xd4d2575b => 48
	i32 3580758918, ; 553: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 323
	i32 3592435036, ; 554: Microsoft.Extensions.Localization.Abstractions => 0xd620355c => 195
	i32 3597029428, ; 555: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 212
	i32 3598340787, ; 556: System.Net.WebSockets.Client => 0xd67a52b3 => 80
	i32 3608519521, ; 557: System.Linq.dll => 0xd715a361 => 62
	i32 3624195450, ; 558: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 107
	i32 3627220390, ; 559: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 261
	i32 3633644679, ; 560: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 216
	i32 3638274909, ; 561: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 50
	i32 3641597786, ; 562: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 247
	i32 3643446276, ; 563: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 320
	i32 3643854240, ; 564: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 258
	i32 3645089577, ; 565: System.ComponentModel.DataAnnotations => 0xd943a729 => 15
	i32 3657292374, ; 566: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 183
	i32 3660523487, ; 567: System.Net.NetworkInformation => 0xda2f27df => 69
	i32 3672681054, ; 568: Mono.Android.dll => 0xdae8aa5e => 172
	i32 3682565725, ; 569: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 222
	i32 3684561358, ; 570: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 226
	i32 3697841164, ; 571: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 325
	i32 3700866549, ; 572: System.Net.WebProxy.dll => 0xdc96bdf5 => 79
	i32 3706696989, ; 573: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 231
	i32 3716563718, ; 574: System.Runtime.Intrinsics => 0xdd864306 => 109
	i32 3718780102, ; 575: Xamarin.AndroidX.Annotation => 0xdda814c6 => 215
	i32 3722202641, ; 576: Microsoft.Extensions.Configuration.Json.dll => 0xdddc4e11 => 186
	i32 3724971120, ; 577: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 257
	i32 3732100267, ; 578: System.Net.NameResolution => 0xde7354ab => 68
	i32 3732214720, ; 579: Microsoft.AspNetCore.Metadata.dll => 0xde7513c0 => 181
	i32 3737834244, ; 580: System.Net.Http.Json.dll => 0xdecad304 => 64
	i32 3748608112, ; 581: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 28
	i32 3751444290, ; 582: System.Xml.XPath => 0xdf9a7f42 => 161
	i32 3758424670, ; 583: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 185
	i32 3776403777, ; 584: Microsoft.Extensions.Localization.Abstractions.dll => 0xe1175941 => 195
	i32 3786282454, ; 585: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 224
	i32 3792276235, ; 586: System.Collections.NonGeneric => 0xe2098b0b => 11
	i32 3800979733, ; 587: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 202
	i32 3802395368, ; 588: System.Collections.Specialized.dll => 0xe2a3f2e8 => 12
	i32 3819260425, ; 589: System.Net.WebProxy => 0xe3a54a09 => 79
	i32 3823082795, ; 590: System.Security.Cryptography.dll => 0xe3df9d2b => 127
	i32 3829621856, ; 591: System.Numerics.dll => 0xe4436460 => 84
	i32 3841636137, ; 592: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 188
	i32 3844307129, ; 593: System.Net.Mail.dll => 0xe52378b9 => 67
	i32 3849253459, ; 594: System.Runtime.InteropServices.dll => 0xe56ef253 => 108
	i32 3870376305, ; 595: System.Net.HttpListener.dll => 0xe6b14171 => 66
	i32 3873536506, ; 596: System.Security.Principal => 0xe6e179fa => 129
	i32 3875112723, ; 597: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 123
	i32 3885497537, ; 598: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 78
	i32 3885922214, ; 599: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 272
	i32 3888767677, ; 600: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 262
	i32 3889960447, ; 601: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 324
	i32 3896106733, ; 602: System.Collections.Concurrent.dll => 0xe839deed => 9
	i32 3896760992, ; 603: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 230
	i32 3898971068, ; 604: Microsoft.Extensions.Localization.dll => 0xe86593bc => 194
	i32 3901907137, ; 605: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 3
	i32 3920810846, ; 606: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 45
	i32 3921031405, ; 607: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 275
	i32 3928044579, ; 608: System.Xml.ReaderWriter => 0xea213423 => 157
	i32 3930554604, ; 609: System.Security.Principal.dll => 0xea4780ec => 129
	i32 3931092270, ; 610: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 260
	i32 3945713374, ; 611: System.Data.DataSetExtensions.dll => 0xeb2ecede => 24
	i32 3953953790, ; 612: System.Text.Encoding.CodePages => 0xebac8bfe => 134
	i32 3954195687, ; 613: Microsoft.Extensions.Localization => 0xebb03ce7 => 194
	i32 3955647286, ; 614: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 218
	i32 3959773229, ; 615: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 249
	i32 3980434154, ; 616: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 319
	i32 3987592930, ; 617: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 301
	i32 4003436829, ; 618: System.Diagnostics.Process.dll => 0xee9f991d => 30
	i32 4015948917, ; 619: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 217
	i32 4023392905, ; 620: System.IO.Pipelines => 0xefd01a89 => 208
	i32 4025784931, ; 621: System.Memory => 0xeff49a63 => 63
	i32 4046471985, ; 622: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 204
	i32 4054681211, ; 623: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 91
	i32 4068434129, ; 624: System.Private.Xml.Linq.dll => 0xf27f60d1 => 88
	i32 4073602200, ; 625: System.Threading.dll => 0xf2ce3c98 => 149
	i32 4094352644, ; 626: Microsoft.Maui.Essentials.dll => 0xf40add04 => 206
	i32 4099507663, ; 627: System.Drawing.dll => 0xf45985cf => 37
	i32 4100113165, ; 628: System.Private.Uri => 0xf462c30d => 87
	i32 4101593132, ; 629: Xamarin.AndroidX.Emoji2 => 0xf479582c => 238
	i32 4102112229, ; 630: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 314
	i32 4125707920, ; 631: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 309
	i32 4126470640, ; 632: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 187
	i32 4127667938, ; 633: System.IO.FileSystem.Watcher => 0xf60736e2 => 51
	i32 4130442656, ; 634: System.AppContext => 0xf6318da0 => 7
	i32 4147896353, ; 635: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 91
	i32 4150914736, ; 636: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 321
	i32 4151237749, ; 637: System.Core => 0xf76edc75 => 22
	i32 4159265925, ; 638: System.Xml.XmlSerializer => 0xf7e95c85 => 163
	i32 4161255271, ; 639: System.Reflection.TypeExtensions => 0xf807b767 => 97
	i32 4164802419, ; 640: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 51
	i32 4181436372, ; 641: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 114
	i32 4182413190, ; 642: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 254
	i32 4185676441, ; 643: System.Security => 0xf97c5a99 => 131
	i32 4196529839, ; 644: System.Net.WebClient.dll => 0xfa21f6af => 77
	i32 4213026141, ; 645: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 28
	i32 4256097574, ; 646: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 231
	i32 4258378803, ; 647: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 253
	i32 4260525087, ; 648: System.Buffers => 0xfdf2741f => 8
	i32 4271975918, ; 649: Microsoft.Maui.Controls.dll => 0xfea12dee => 203
	i32 4274976490, ; 650: System.Runtime.Numerics => 0xfecef6ea => 111
	i32 4292120959, ; 651: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 254
	i32 4294648842, ; 652: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 191
	i32 4294763496 ; 653: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 240
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [654 x i32] [
	i32 69, ; 0
	i32 68, ; 1
	i32 109, ; 2
	i32 250, ; 3
	i32 284, ; 4
	i32 49, ; 5
	i32 81, ; 6
	i32 146, ; 7
	i32 31, ; 8
	i32 325, ; 9
	i32 125, ; 10
	i32 207, ; 11
	i32 103, ; 12
	i32 268, ; 13
	i32 108, ; 14
	i32 268, ; 15
	i32 140, ; 16
	i32 288, ; 17
	i32 78, ; 18
	i32 125, ; 19
	i32 14, ; 20
	i32 224, ; 21
	i32 133, ; 22
	i32 270, ; 23
	i32 152, ; 24
	i32 322, ; 25
	i32 323, ; 26
	i32 19, ; 27
	i32 222, ; 28
	i32 27, ; 29
	i32 244, ; 30
	i32 2, ; 31
	i32 60, ; 32
	i32 43, ; 33
	i32 92, ; 34
	i32 176, ; 35
	i32 227, ; 36
	i32 148, ; 37
	i32 246, ; 38
	i32 243, ; 39
	i32 294, ; 40
	i32 55, ; 41
	i32 70, ; 42
	i32 322, ; 43
	i32 213, ; 44
	i32 84, ; 45
	i32 307, ; 46
	i32 245, ; 47
	i32 306, ; 48
	i32 132, ; 49
	i32 56, ; 50
	i32 150, ; 51
	i32 0, ; 52
	i32 75, ; 53
	i32 146, ; 54
	i32 63, ; 55
	i32 147, ; 56
	i32 326, ; 57
	i32 166, ; 58
	i32 318, ; 59
	i32 228, ; 60
	i32 13, ; 61
	i32 241, ; 62
	i32 126, ; 63
	i32 153, ; 64
	i32 114, ; 65
	i32 167, ; 66
	i32 165, ; 67
	i32 243, ; 68
	i32 256, ; 69
	i32 85, ; 70
	i32 305, ; 71
	i32 299, ; 72
	i32 200, ; 73
	i32 151, ; 74
	i32 288, ; 75
	i32 61, ; 76
	i32 196, ; 77
	i32 52, ; 78
	i32 104, ; 79
	i32 115, ; 80
	i32 41, ; 81
	i32 281, ; 82
	i32 279, ; 83
	i32 191, ; 84
	i32 121, ; 85
	i32 313, ; 86
	i32 53, ; 87
	i32 45, ; 88
	i32 120, ; 89
	i32 233, ; 90
	i32 311, ; 91
	i32 239, ; 92
	i32 82, ; 93
	i32 0, ; 94
	i32 137, ; 95
	i32 275, ; 96
	i32 220, ; 97
	i32 9, ; 98
	i32 74, ; 99
	i32 293, ; 100
	i32 156, ; 101
	i32 290, ; 102
	i32 155, ; 103
	i32 93, ; 104
	i32 285, ; 105
	i32 46, ; 106
	i32 308, ; 107
	i32 296, ; 108
	i32 289, ; 109
	i32 110, ; 110
	i32 130, ; 111
	i32 26, ; 112
	i32 210, ; 113
	i32 73, ; 114
	i32 56, ; 115
	i32 47, ; 116
	i32 317, ; 117
	i32 199, ; 118
	i32 234, ; 119
	i32 180, ; 120
	i32 23, ; 121
	i32 248, ; 122
	i32 87, ; 123
	i32 44, ; 124
	i32 161, ; 125
	i32 72, ; 126
	i32 261, ; 127
	i32 4, ; 128
	i32 43, ; 129
	i32 64, ; 130
	i32 1, ; 131
	i32 17, ; 132
	i32 54, ; 133
	i32 320, ; 134
	i32 284, ; 135
	i32 106, ; 136
	i32 289, ; 137
	i32 282, ; 138
	i32 245, ; 139
	i32 35, ; 140
	i32 159, ; 141
	i32 86, ; 142
	i32 33, ; 143
	i32 13, ; 144
	i32 52, ; 145
	i32 193, ; 146
	i32 57, ; 147
	i32 265, ; 148
	i32 37, ; 149
	i32 188, ; 150
	i32 295, ; 151
	i32 283, ; 152
	i32 218, ; 153
	i32 36, ; 154
	i32 59, ; 155
	i32 252, ; 156
	i32 174, ; 157
	i32 18, ; 158
	i32 286, ; 159
	i32 165, ; 160
	i32 185, ; 161
	i32 308, ; 162
	i32 251, ; 163
	i32 198, ; 164
	i32 278, ; 165
	i32 1, ; 166
	i32 314, ; 167
	i32 154, ; 168
	i32 189, ; 169
	i32 274, ; 170
	i32 259, ; 171
	i32 312, ; 172
	i32 220, ; 173
	i32 30, ; 174
	i32 53, ; 175
	i32 310, ; 176
	i32 279, ; 177
	i32 6, ; 178
	i32 294, ; 179
	i32 269, ; 180
	i32 273, ; 181
	i32 225, ; 182
	i32 290, ; 183
	i32 217, ; 184
	i32 236, ; 185
	i32 86, ; 186
	i32 278, ; 187
	i32 62, ; 188
	i32 113, ; 189
	i32 58, ; 190
	i32 324, ; 191
	i32 265, ; 192
	i32 100, ; 193
	i32 20, ; 194
	i32 229, ; 195
	i32 112, ; 196
	i32 102, ; 197
	i32 103, ; 198
	i32 292, ; 199
	i32 105, ; 200
	i32 282, ; 201
	i32 72, ; 202
	i32 39, ; 203
	i32 33, ; 204
	i32 190, ; 205
	i32 104, ; 206
	i32 74, ; 207
	i32 298, ; 208
	i32 10, ; 209
	i32 124, ; 210
	i32 47, ; 211
	i32 219, ; 212
	i32 200, ; 213
	i32 10, ; 214
	i32 44, ; 215
	i32 5, ; 216
	i32 266, ; 217
	i32 302, ; 218
	i32 297, ; 219
	i32 193, ; 220
	i32 32, ; 221
	i32 139, ; 222
	i32 93, ; 223
	i32 180, ; 224
	i32 94, ; 225
	i32 317, ; 226
	i32 50, ; 227
	i32 142, ; 228
	i32 113, ; 229
	i32 141, ; 230
	i32 235, ; 231
	i32 116, ; 232
	i32 283, ; 233
	i32 158, ; 234
	i32 77, ; 235
	i32 80, ; 236
	i32 255, ; 237
	i32 38, ; 238
	i32 277, ; 239
	i32 186, ; 240
	i32 239, ; 241
	i32 232, ; 242
	i32 65, ; 243
	i32 139, ; 244
	i32 16, ; 245
	i32 179, ; 246
	i32 117, ; 247
	i32 271, ; 248
	i32 280, ; 249
	i32 227, ; 250
	i32 49, ; 251
	i32 71, ; 252
	i32 81, ; 253
	i32 127, ; 254
	i32 95, ; 255
	i32 122, ; 256
	i32 287, ; 257
	i32 27, ; 258
	i32 248, ; 259
	i32 98, ; 260
	i32 29, ; 261
	i32 223, ; 262
	i32 315, ; 263
	i32 293, ; 264
	i32 150, ; 265
	i32 208, ; 266
	i32 170, ; 267
	i32 5, ; 268
	i32 99, ; 269
	i32 178, ; 270
	i32 34, ; 271
	i32 94, ; 272
	i32 270, ; 273
	i32 196, ; 274
	i32 22, ; 275
	i32 42, ; 276
	i32 171, ; 277
	i32 309, ; 278
	i32 241, ; 279
	i32 301, ; 280
	i32 255, ; 281
	i32 286, ; 282
	i32 280, ; 283
	i32 260, ; 284
	i32 3, ; 285
	i32 135, ; 286
	i32 112, ; 287
	i32 197, ; 288
	i32 321, ; 289
	i32 210, ; 290
	i32 318, ; 291
	i32 59, ; 292
	i32 96, ; 293
	i32 300, ; 294
	i32 40, ; 295
	i32 221, ; 296
	i32 26, ; 297
	i32 95, ; 298
	i32 90, ; 299
	i32 100, ; 300
	i32 11, ; 301
	i32 88, ; 302
	i32 101, ; 303
	i32 267, ; 304
	i32 182, ; 305
	i32 287, ; 306
	i32 212, ; 307
	i32 297, ; 308
	i32 8, ; 309
	i32 252, ; 310
	i32 292, ; 311
	i32 209, ; 312
	i32 89, ; 313
	i32 184, ; 314
	i32 247, ; 315
	i32 155, ; 316
	i32 296, ; 317
	i32 34, ; 318
	i32 192, ; 319
	i32 117, ; 320
	i32 83, ; 321
	i32 21, ; 322
	i32 12, ; 323
	i32 163, ; 324
	i32 4, ; 325
	i32 205, ; 326
	i32 304, ; 327
	i32 199, ; 328
	i32 197, ; 329
	i32 85, ; 330
	i32 291, ; 331
	i32 65, ; 332
	i32 306, ; 333
	i32 274, ; 334
	i32 144, ; 335
	i32 256, ; 336
	i32 158, ; 337
	i32 42, ; 338
	i32 118, ; 339
	i32 183, ; 340
	i32 211, ; 341
	i32 300, ; 342
	i32 263, ; 343
	i32 132, ; 344
	i32 76, ; 345
	i32 67, ; 346
	i32 310, ; 347
	i32 173, ; 348
	i32 215, ; 349
	i32 144, ; 350
	i32 107, ; 351
	i32 152, ; 352
	i32 71, ; 353
	i32 157, ; 354
	i32 182, ; 355
	i32 122, ; 356
	i32 128, ; 357
	i32 305, ; 358
	i32 153, ; 359
	i32 238, ; 360
	i32 176, ; 361
	i32 142, ; 362
	i32 225, ; 363
	i32 302, ; 364
	i32 21, ; 365
	i32 15, ; 366
	i32 201, ; 367
	i32 136, ; 368
	i32 76, ; 369
	i32 60, ; 370
	i32 228, ; 371
	i32 168, ; 372
	i32 169, ; 373
	i32 203, ; 374
	i32 16, ; 375
	i32 75, ; 376
	i32 7, ; 377
	i32 24, ; 378
	i32 250, ; 379
	i32 209, ; 380
	i32 175, ; 381
	i32 92, ; 382
	i32 303, ; 383
	i32 2, ; 384
	i32 137, ; 385
	i32 251, ; 386
	i32 273, ; 387
	i32 135, ; 388
	i32 70, ; 389
	i32 177, ; 390
	i32 147, ; 391
	i32 189, ; 392
	i32 312, ; 393
	i32 291, ; 394
	i32 242, ; 395
	i32 198, ; 396
	i32 89, ; 397
	i32 97, ; 398
	i32 232, ; 399
	i32 237, ; 400
	i32 307, ; 401
	i32 32, ; 402
	i32 46, ; 403
	i32 246, ; 404
	i32 211, ; 405
	i32 110, ; 406
	i32 159, ; 407
	i32 36, ; 408
	i32 23, ; 409
	i32 115, ; 410
	i32 179, ; 411
	i32 58, ; 412
	i32 271, ; 413
	i32 145, ; 414
	i32 119, ; 415
	i32 121, ; 416
	i32 111, ; 417
	i32 213, ; 418
	i32 140, ; 419
	i32 175, ; 420
	i32 219, ; 421
	i32 55, ; 422
	i32 106, ; 423
	i32 313, ; 424
	i32 204, ; 425
	i32 205, ; 426
	i32 134, ; 427
	i32 285, ; 428
	i32 276, ; 429
	i32 264, ; 430
	i32 319, ; 431
	i32 242, ; 432
	i32 207, ; 433
	i32 160, ; 434
	i32 298, ; 435
	i32 229, ; 436
	i32 164, ; 437
	i32 133, ; 438
	i32 264, ; 439
	i32 162, ; 440
	i32 311, ; 441
	i32 181, ; 442
	i32 253, ; 443
	i32 141, ; 444
	i32 276, ; 445
	i32 272, ; 446
	i32 170, ; 447
	i32 206, ; 448
	i32 214, ; 449
	i32 281, ; 450
	i32 41, ; 451
	i32 240, ; 452
	i32 82, ; 453
	i32 178, ; 454
	i32 57, ; 455
	i32 38, ; 456
	i32 98, ; 457
	i32 167, ; 458
	i32 173, ; 459
	i32 192, ; 460
	i32 277, ; 461
	i32 83, ; 462
	i32 216, ; 463
	i32 99, ; 464
	i32 31, ; 465
	i32 160, ; 466
	i32 19, ; 467
	i32 128, ; 468
	i32 120, ; 469
	i32 236, ; 470
	i32 267, ; 471
	i32 249, ; 472
	i32 269, ; 473
	i32 166, ; 474
	i32 244, ; 475
	i32 326, ; 476
	i32 266, ; 477
	i32 257, ; 478
	i32 171, ; 479
	i32 17, ; 480
	i32 145, ; 481
	i32 304, ; 482
	i32 126, ; 483
	i32 119, ; 484
	i32 39, ; 485
	i32 116, ; 486
	i32 48, ; 487
	i32 143, ; 488
	i32 118, ; 489
	i32 35, ; 490
	i32 174, ; 491
	i32 96, ; 492
	i32 54, ; 493
	i32 258, ; 494
	i32 130, ; 495
	i32 154, ; 496
	i32 25, ; 497
	i32 162, ; 498
	i32 235, ; 499
	i32 149, ; 500
	i32 105, ; 501
	i32 90, ; 502
	i32 223, ; 503
	i32 61, ; 504
	i32 143, ; 505
	i32 101, ; 506
	i32 6, ; 507
	i32 14, ; 508
	i32 123, ; 509
	i32 136, ; 510
	i32 29, ; 511
	i32 299, ; 512
	i32 73, ; 513
	i32 233, ; 514
	i32 25, ; 515
	i32 221, ; 516
	i32 262, ; 517
	i32 259, ; 518
	i32 316, ; 519
	i32 138, ; 520
	i32 214, ; 521
	i32 230, ; 522
	i32 169, ; 523
	i32 263, ; 524
	i32 295, ; 525
	i32 102, ; 526
	i32 124, ; 527
	i32 234, ; 528
	i32 190, ; 529
	i32 184, ; 530
	i32 187, ; 531
	i32 164, ; 532
	i32 168, ; 533
	i32 237, ; 534
	i32 40, ; 535
	i32 202, ; 536
	i32 303, ; 537
	i32 177, ; 538
	i32 18, ; 539
	i32 172, ; 540
	i32 316, ; 541
	i32 315, ; 542
	i32 138, ; 543
	i32 151, ; 544
	i32 226, ; 545
	i32 201, ; 546
	i32 156, ; 547
	i32 131, ; 548
	i32 20, ; 549
	i32 66, ; 550
	i32 148, ; 551
	i32 48, ; 552
	i32 323, ; 553
	i32 195, ; 554
	i32 212, ; 555
	i32 80, ; 556
	i32 62, ; 557
	i32 107, ; 558
	i32 261, ; 559
	i32 216, ; 560
	i32 50, ; 561
	i32 247, ; 562
	i32 320, ; 563
	i32 258, ; 564
	i32 15, ; 565
	i32 183, ; 566
	i32 69, ; 567
	i32 172, ; 568
	i32 222, ; 569
	i32 226, ; 570
	i32 325, ; 571
	i32 79, ; 572
	i32 231, ; 573
	i32 109, ; 574
	i32 215, ; 575
	i32 186, ; 576
	i32 257, ; 577
	i32 68, ; 578
	i32 181, ; 579
	i32 64, ; 580
	i32 28, ; 581
	i32 161, ; 582
	i32 185, ; 583
	i32 195, ; 584
	i32 224, ; 585
	i32 11, ; 586
	i32 202, ; 587
	i32 12, ; 588
	i32 79, ; 589
	i32 127, ; 590
	i32 84, ; 591
	i32 188, ; 592
	i32 67, ; 593
	i32 108, ; 594
	i32 66, ; 595
	i32 129, ; 596
	i32 123, ; 597
	i32 78, ; 598
	i32 272, ; 599
	i32 262, ; 600
	i32 324, ; 601
	i32 9, ; 602
	i32 230, ; 603
	i32 194, ; 604
	i32 3, ; 605
	i32 45, ; 606
	i32 275, ; 607
	i32 157, ; 608
	i32 129, ; 609
	i32 260, ; 610
	i32 24, ; 611
	i32 134, ; 612
	i32 194, ; 613
	i32 218, ; 614
	i32 249, ; 615
	i32 319, ; 616
	i32 301, ; 617
	i32 30, ; 618
	i32 217, ; 619
	i32 208, ; 620
	i32 63, ; 621
	i32 204, ; 622
	i32 91, ; 623
	i32 88, ; 624
	i32 149, ; 625
	i32 206, ; 626
	i32 37, ; 627
	i32 87, ; 628
	i32 238, ; 629
	i32 314, ; 630
	i32 309, ; 631
	i32 187, ; 632
	i32 51, ; 633
	i32 7, ; 634
	i32 91, ; 635
	i32 321, ; 636
	i32 22, ; 637
	i32 163, ; 638
	i32 97, ; 639
	i32 51, ; 640
	i32 114, ; 641
	i32 254, ; 642
	i32 131, ; 643
	i32 77, ; 644
	i32 28, ; 645
	i32 231, ; 646
	i32 253, ; 647
	i32 8, ; 648
	i32 203, ; 649
	i32 111, ; 650
	i32 254, ; 651
	i32 191, ; 652
	i32 240 ; 653
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
