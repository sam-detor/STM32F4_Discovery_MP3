"""Module that spins up the offloaded code binary linker script based on the information given by
   the user in RemoteInit.h, the InitCode linker script template (InitCode_TEMPLATE.ld), and
   the elf file of the non-offloaded compiled code. The usage of this module is as follows:
             python3 spin_up_ld_script.py <path-to-elf-file-of-compiled-code>
   **This code was written by ChatGPT"""
import locale
import sys
from elftools.elf.elffile import ELFFile


def get_ebss_value(elf_path):
    """Function that gets the ebss (end of the bss sections) value from the elf file at elf_path"""
    
    with open(elf_path, 'rb') as file: #open the elf file
        elf = ELFFile(file)

        # Access the symbol table
        symtab = elf.get_section_by_name('.symtab')

        if symtab is not None:
            # Find the symbol with name "_ebss"
            for symbol in symtab.iter_symbols():
                if symbol.name == '_ebss':
                    return symbol['st_value']

        print("Symbol _ebss not found")
        return None

def generate_linker_script(output_file, ram_code_start):
    """Function that replaces the RAM_CODE_START value in the linker script with the provided 
       ram_code_start value and saves the new file as InitCode.ld (this will be your 
       offloaded code binary)"""
    
    # Read the linker script template
    with open('InitCode_TEMPLATE.ld', 'r', encoding=locale.getpreferredencoding()) as template_file:
        template_content = template_file.read()

    # Replace placeholder with variable value
    modified_content = template_content.replace('{RAM_CODE_START}', str(ram_code_start))

    # Write the modified linker script
    with open(output_file, 'w', encoding=locale.getpreferredencoding()) as output:
        output.write(modified_content)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python spin_up_ld_script.py <path-to-elf-file-of-compiled-code>")
        sys.exit(1)

    ELF_FILE_PATH = sys.argv[1]
    codeStart = get_ebss_value(ELF_FILE_PATH)
    generate_linker_script("InitCode2.ld", hex(codeStart))
