using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FYP_Start_V2
{
    public class File_Type
    {
        public string[] Document = { "doc", "docx", "odt", "rtf", "txt", "pdf", "html", "htm", "ppt", "pptx" };
        public string[] Compressed = {"zip", "rar", "iso", "arj", "tar.gz", "tgz" };
        public string[] Application = { "exe", "apk", "dmg", "pkg" };
        public string[] Image = { "jpg","JPG", "jpeg", "tiff", "jfif", "exif", "gif", "bmp", "png", "ppm", "pgm", "pbm", "pnm", "webp", "heif", "bat", "bpg", "cgm", "svg", "ai", "ps" };
        public string[] Music = { "mp3", "wav", "aiff", "au", "pcm", "ape", "flac", "wv", "m4a", "opus", "aac", "vorbis", "wma", "atrac" };
        public string[] Video = { "avi", "flv", "wmv", "mov", "mp4", "mkv", "webm", "vob", "ogg", "drc", "yuv", "rm", "asf", "amv", "mp4", "m4v", "svi", "3gp" };

    }
}