/* 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

namespace GICR {

	/**
	 * The property types supported by the JCR standard.
	 *
	 * * The STRING property type is used to store strings.
	 * * BINARY properties are used to store binary data.
	 * * The LONG property type is used to store integers.
	 * * The DECIMAL property type is used to store precise decimal numbers.
	 * * The DOUBLE property type is used to store floating point numbers.
	 * * The DATE property type is used to store time and date information. See 4.2.6.1 Date in the specification.
	 * * The BOOLEAN property type is used to store boolean values.
	 * * A NAME is a pairing of a namespace and a local name. When read, the namespace is mapped to the current prefix.
	 * See 4.2.6.2 Name in the specification.
	 * * A PATH property is an ordered list of path elements. A path element is a NAME with an optional index.
	 * When read, the NAMEs within the path are mapped to their current prefix. A path may be absolute or relative.
	 * See 4.2.6.3 Path in the specification.
	 * * A REFERENCE property stores the identifier of a referenceable node (one having type mix:referenceable),
	 * which must exist within the same workspace or session as the REFERENCE property. A REFERENCE property enforces this
	 * referential integrity by preventing (in level 2 implementations) the removal of its target node.
	 * See 4.2.6.4 Reference in the specification.
	 * * A WEAKREFERENCE property stores the identifier of a referenceable node (one having type mix:referenceable).
	 * * A WEAKREFERENCE property does not enforce referential integrity. See 4.2.6.5 Weak Reference in the specification.
	 * * A URI property is identical to STRING property except that it only accepts values that conform to the
	 * syntax of a URI-reference as defined in RFC 3986. See also 4.2.6.6 URI in the specification.
	 * * UNDEFINED can be used within a property definition (see 4.7.5 Property Definitions) to specify that the
	 * property in question may be of any type. However, it cannot be the actual type of any property instance.
	 * For example it will never be returned by PropertyInterface::getType() and (in level 2 implementations) it cannot be assigned
	 * as the type when creating a new property.
	 */
	public class PropertyType : Object {

		/**
		 * This constant can be used within a property definition to specify that
		 * the property in question may be of any type.
		 *
		 * However, it cannot be the actual type of any property instance. For
		 * example, it will never be returned by Property#getType and it cannot be
		 * assigned as the type when creating a new property.
		 */
		public const int UNDEFINED = 0;

		/**
		 * The STRING property type is used to store strings.
		 */
		public const int STRING = 1;

		/**
		 * BINARY properties are used to store binary data.
		 */
		public const int BINARY = 2;

		/**
		 * The LONG property type is used to store integers.
		 */
		public const int LONG = 3;

		/**
		 * The DOUBLE property type is used to store floating point numbers.
		 */
		public const int DOUBLE = 4;

		/**
		 * The DATE property type is used to store time and date information.
		 */
		public const int DATE = 5;

		/**
		 * The BOOLEAN property type is used to store boolean values.
		 */
		public const int BOOLEAN = 6;

		/**
		 * A NAME is a pairing of a namespace and a local name. When read, the
		 * namespace is mapped to the current prefix.
		 */
		public const int NAME = 7;

		/**
		 * A PATH property is an ordered list of path elements. A path element is a
		 * NAME with an optional index. When read, the NAMEs within the path are
		 * mapped to their current prefix. A path may be absolute or relative.
		 */
		public const int PATH = 8;

		/**
		 * A REFERENCE property stores the identifier of a referenceable node (one
		 * having type mix:referenceable), which must exist within the same
		 * workspace or session as the REFERENCE property. A REFERENCE property
		 * enforces this referential integrity by preventing the removal of its
		 * target node.
		 */
		public const int REFERENCE = 9;

		/**
		 * A WEAKREFERENCE property stores the identifier of a referenceable node
		 * (one having type mix:referenceable). A WEAKREFERENCE property does not
		 * enforce referential integrity.
		 */
		public const int WEAKREFERENCE = 10;

		/**
		 * A URI property is identical to STRING property except that it only
		 * accepts values that conform to the syntax of a URI-reference as defined
		 * in RFC 3986.
		 */
		public const int URI = 11;

		/**
		 * The DECIMAL property type is used to store precise decimal numbers.
		 */
		public const int DECIMAL = 12;

		/**
		 * String constant for type name as used in serialization.
		 */
		public const string TYPENAME_UNDEFINED = "undefined";

		/**
		 * String constant for type name as used in serialization.
		 */
		public const string TYPENAME_STRING = "String";

		/**
		 * String constant for type name as used in serialization.
		 */
		public const string TYPENAME_BINARY = "Binary";

		/**
		 * String constant for type name as used in serialization.
		 */
		public const string TYPENAME_LONG = "Long";

		/**
		 * String constant for type name as used in serialization.
		 */
		public const string TYPENAME_DOUBLE = "Double";

		/**
		 * String constant for type name as used in serialization.
		 */
		public const string TYPENAME_DATE = "Date";

		/**
		 * String constant for type name as used in serialization.
		 */
		public const string TYPENAME_BOOLEAN = "Boolean";

		/**
		 * String constant for type name as used in serialization.
		 */
		public const string TYPENAME_NAME = "Name";

		/**
		 * String constant for type name as used in serialization.
		 */
		public const string TYPENAME_PATH = "Path";

		/**
		 * String constant for type name as used in serialization.
		 */
		public const string TYPENAME_REFERENCE = "Reference";

		/**
		 * String constant for type name as used in serialization.
		 */
		public const string TYPENAME_WEAKREFERENCE = "WeakReference";

		/**
		 * String constant for type name as used in serialization.
		 */
		public const string TYPENAME_URI = "URI";

		/**
		 * String constant for type name as used in serialization.
		 */
		public const string TYPENAME_DECIMAL = "Decimal";


		/**
		 * Returns the name of the specified type, as used in serialization.
		 *
		 * @param type type the property type
		 * @return name of the specified type
		 *
		 * @throws InvalidArgumentException if the given type is unknown.
		 */
		public string name_from_value (int type)
    		{
		}

		/**
		 * Returns the numeric constant value of the type with the specified name.
		 *
		 * @param name The name of the property type
		 * @return The numeric constant value
		 *
		 * @throws InvalidArgumentException if the given name is unknown.
		 */
		public int value_from_name (string name)
    		{
		}
	}
}
