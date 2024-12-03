

import re

def HTMLBoilerStart():
    return "\
<!DOCTYPE NETSCAPE-Bookmark-file-1>\n\
<HTML>\n\
    <META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=UTF-8a\">\n\
    <Title>Bookmarks</Title>\n\
    <H1>Bookmarks</H1>\n"

def HTMLBoilerEnd():
    return "</HTML>"


def HTMLTabLevel(N=1):
    NumberOfTabs=N*"    "
    return NumberOfTabs

def MarkdownFolderHtmlFolder(folderstring, tabdepth):
    FolderName=folderstring.split(' ', 1)[1]
    HTMLFolderString=f"{HTMLTabLevel(tabdepth)}<DT><H3 FOLDED>{FolderName}</H3>\n{HTMLTabLevel(tabdepth)}<DL><p>\n"
    return HTMLFolderString



def MarkdownBookmarkToHtml(bookmarkstring, tabdepth):
    bookmarkName = re.search(r"\[(.*?)\]", bookmarkstring).group(1)
    bookmarkURL = re.search(r"\((.*?)\)", bookmarkstring).group(1)
    HTMLBookmarkString=f"{HTMLTabLevel(tabdepth)}<DT><A HREF=\"{bookmarkURL}\">{bookmarkName}</A>\n"
#     print(bookmarkName, bookmarkURL)
#     print(HTMLBookmarkString)
    return HTMLBookmarkString

def HTMLFolderClose(tabdepth):
    return f"{HTMLTabLevel(tabdepth)}</DL><p>\n"

def main():
    # 1. Start writing html file
    # 2. Read markdown file
    # 3. Each time "##" is enouncterd make a folder, similar for subfolders (regex: /\#\#/gm)
    # 4. Each time "- " make a bookmark (regex:/-\ /gm)
    # 4. write html tp output

    markdown_file_name="bookmarks.md"
    html_file_name="bookmarks.html"

    fileHTML = open(html_file_name, "w")
    fileHTML.write(HTMLBoilerStart())


    # Markown Style
    # #Title is ignored
    # ## Folder lvl 1, further # increases folder level
    i=0
    folderTabDepth=3
    folderTabDepthList=[]
    with open(markdown_file_name) as infile:
        for line in infile:
            if line.split(" ")[0]==("#"):
                continue
            i+=1
#             if i==20:
#                 break
            line=line[0:-1] #Strip \n
            if line.split(" ")[0].startswith("##"):
                folderTabDepth=len(line.split(' ',1)[0]) - 1
                if folderTabDepth in folderTabDepthList:
                    folderTabDepthList.sort(reverse=True)
                    for tabDepths in folderTabDepthList:
                        if tabDepths >= folderTabDepth:
                            fileHTML.write(HTMLFolderClose(tabDepths))
                            folderTabDepthList.remove(tabDepths)
                folderTabDepthList.append(folderTabDepth)
                fileHTML.write(MarkdownFolderHtmlFolder(line, folderTabDepth))
                folderTabDepth+=1
            else:
                fileHTML.write(MarkdownBookmarkToHtml(line, max(folderTabDepthList)+1))
    folderTabDepthList.sort(reverse=True)
    for tabDepths in folderTabDepthList:
        fileHTML.write(HTMLFolderClose(tabDepths))
    fileHTML.write(HTMLBoilerEnd())
    fileHTML.close






if __name__=="__main__":
    main()

